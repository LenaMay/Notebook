//
//  NSOperationDemoViewController.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/20.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "NSOperationDemoViewController.h"
#import "LoadImageOperation.h"
@interface NSOperationDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)load:(UIButton *)sender;

@end

@implementation NSOperationDemoViewController

{
    NSString *imgUrl;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    imgUrl = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*kE8-X3OjeiiSPQFyhL2Tdg.jpeg";
    
}

//使用子类NSInvocationOperation
-(void)useInvocationOperation{
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadImageSource:) object:imgUrl];
    //[invocationOperation start];//直接会在当前线程主线程执行
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:invocationOperation];
    
}

//使用子类NSBlockOperation
-(void)useBlockOperation{
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImageSource:imgUrl];
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:blockOperation];
    
}
//使用继承NSOperation
-(void)useSubclassOperation{
    
    LoadImageOperation *imageOperation = [LoadImageOperation new];
    imageOperation.loadDelegate = self;
    imageOperation.imgUrl = imgUrl;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:imageOperation];
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
    
    [self.imageView setImage:image];
}

-(void) loadImageFinish:(UIImage *)image{
    
    [self.imageView setImage:image];
}

- (IBAction)load:(UIButton *)sender {
    
    
    [self.imageView setImage:nil];
    
    switch (sender.tag) {
        case 1:
            [self useInvocationOperation];
            break;
        case 2:
            [self useBlockOperation];
            break;
        case 3:
            [self useSubclassOperation];
            break;
            
        default:
            break;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
