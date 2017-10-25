//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "ContentViewModeDetailViewController.h"

@interface ContentViewModeDetailViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ContentViewModeDetailViewController

#pragma mark - Managing the detail item


- (void)configureView {
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor whiteColor];

    //  contentMode
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageView];
    
    self.imageView.image = [UIImage imageNamed:@"image002"];
    
    // 内容缩放
//    self.imageView.contentMode = UIViewContentModeScaleToFill;
    
    // 等比例缩放，显示全部
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 等比例缩放，填满
//    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.imageView.clipsToBounds = YES;

    // 不缩放，内容在中间
    self.imageView.contentMode = UIViewContentModeLeft;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

@end
