//
//  GCDDemoViewController.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/20.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "GCDDemoViewController.h"

@interface GCDDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

- (IBAction)onClick:(UIButton *)sender;

@end

@implementation GCDDemoViewController{
    NSString *imgUrl1;
    NSString *imgUrl2;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    imgUrl1 = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*zF0J7XHubBjojgJdYRS0FA.jpeg";
    imgUrl2 = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*kE8-X3OjeiiSPQFyhL2Tdg.jpeg";
}

//后台执行
-(void)globalQueue{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self loadImageSource:imgUrl1];
    });
}
//UI线程执行(只是为了测试,长时间的加载不能放在主线程)
-(void)mainQueue{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self loadImageSource:imgUrl1];
    });
}

//一次性执行(常用来写单例)
-(void)dispatchOnce{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadImageSource:imgUrl1];
    });
}
//后台执行：加载两张图片
-(void)globalQueue2{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image1 = [self loadImage:imgUrl1];
        UIImage *image2 = [self loadImage:imgUrl2];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageview1.image = image1;
            self.imageView2.image = image2;
        });
    });
}
//同步执行
//内部并发运算,等待所有运算结束
-(void)dispatchApply{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    size_t count = 10;
    dispatch_apply(count, queue, ^(size_t i) {
        NSLog(@"循环执行第%li次",i);
        //[self loadImageSource:imgUrl1];
    });
    NSLog(@"运行结束");
}
//异步执行
//并发线程组
-(void)dispatchGroup{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    dispatch_async(queue, ^{
        
        dispatch_group_t group = dispatch_group_create();
        
        __block UIImage *image1 = nil;
        __block UIImage *image2 = nil;
        
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"下载图片1");
            image1 = [self loadImage:imgUrl1];
        });
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"下载图片2");
            image2 = [self loadImage:imgUrl2];
        });
        
        //所有的任务执行完成后触发
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            NSLog(@"图片加载完成");
            self.imageview1.image = image1;
            self.imageView2.image = image2;
            
        });
    });
    NSLog(@"异步执行");

}


// 延迟执行
-(void)dispatchAfter{
    NSLog(@"Delay 2 seconds");
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self loadImageSource:imgUrl1];
    });
    
    /**
     * 如果不使用延时,程序会再子线程上直接调用该方法，方法会被调用
     * 如果使用延时,在子线程中方法不会被调用，因为该方法等待定时器去调用，而子线程中没有定时器，所以不会调用
     */
    //[self performSelector:@selector(loadImageSource:) withObject:imgUrl1 afterDelay:delayInSeconds];
}

// 自定义dispatch_queue_t
-(void)defineDispatch{
    //串行队列
//    dispatch_queue_t urls_queue = dispatch_queue_create("com.baijiahulian.student", DISPATCH_QUEUE_SERIAL);
    //并行队列
    dispatch_queue_t urls_queue = dispatch_queue_create("com.baijiahulian.student", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(urls_queue, ^{
        [self loadImageSource:imgUrl1];
    });
}

-(void)loadImageSource:(NSString *)url{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (imgData!=nil) {
        [self performSelectorOnMainThread:@selector(refreshImageView1:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"there no image data");
    }
    
}

-(void)refreshImageView1:(UIImage *)image{
    
    [self.imageview1 setImage:image];
}

-(UIImage *)loadImage:(NSString *)url{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (image!=nil) {
        return image;
    }else{
        NSLog(@"there no image data");
        return image;
    }
    
}

- (IBAction)onClick:(UIButton *)sender {
    
    [self.imageview1 setImage:nil];
    [self.imageView2 setImage:nil];
    
    switch (sender.tag) {
        case 1:
            [self globalQueue];
            break;
        case 2:
            [self mainQueue];
            break;
        case 3:
            [self dispatchOnce];
            break;
        case 4:
            [self dispatchApply];
            break;
        case 5:
            [self globalQueue2];
            break;
        case 6:
            [self dispatchGroup];
            break;
        case 7:
            [self dispatchAfter];
            break;
        case 8:
            [self defineDispatch];
            break;
            
        default:
            break;
    }
}


@end
