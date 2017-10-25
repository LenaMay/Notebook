//
//  NSThreadDemoViewController.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/20.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "NSThreadDemoViewController.h"

@interface NSThreadDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)load:(UIButton *)sender;

@end

@implementation NSThreadDemoViewController
{
    NSString *imgUrl;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    imgUrl = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*zF0J7XHubBjojgJdYRS0FA.jpeg";
}

//动态创建线程
-(void)dynamicCreateThread{
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImageSource:) object:imgUrl];
    // 设置线程的优先级(0.0 - 1.0，1.0最高级) iOS8被废弃 推荐使用qualityOfService
    thread.threadPriority = 1;
//     thread.qualityOfService = NSQualityOfServiceUserInitiated;

    [thread start];
}

//静态创建线程
-(void)staticCreateThread{
    
    [NSThread detachNewThreadSelector:@selector(loadImageSource:) toTarget:self withObject:imgUrl];
    
}

//隐式创建线程
-(void)implicitCreateThread{
    
    [self performSelectorInBackground:@selector(loadImageSource:) withObject:imgUrl];
}

-(void)loadImageSource:(NSString *)url{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (imgData!=nil) {
        //在主线程执行UI
        [self performSelectorOnMainThread:@selector(refreshImageView:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"there no image data");
    }
    
}

-(void)refreshImageView:(UIImage *)image{
    [self.imageView setImage:image];
}

- (IBAction)load:(UIButton *)sender {
    [self.imageView setImage:nil];
    
    switch (sender.tag) {
        case 1:
            [self dynamicCreateThread];
            break;
        case 2:
            [self staticCreateThread];
            break;
        case 3:
            [self implicitCreateThread];
            break;
        default:
            break;
    }
    
}
@end
