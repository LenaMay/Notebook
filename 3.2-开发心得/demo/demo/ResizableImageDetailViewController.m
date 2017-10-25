//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ResizableImageDetailViewController.h"

@interface ResizableImageDetailViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ResizableImageDetailViewController

#pragma mark - Managing the detail item


- (void)configureView {
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *bubbleBgView = [[UIImageView alloc] init];
    bubbleBgView.backgroundColor = [UIColor clearColor];
    bubbleBgView.image = [[UIImage imageNamed:@"txc_dialog_b"] resizableImageWithCapInsets:UIEdgeInsetsMake(39, 9, 1, 4)];
    [self.view addSubview:bubbleBgView];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"这段文字的背景使用用resizableImageWithCapInsets方法拉伸的图片来展示的";
    label.numberOfLines = 0;
    [bubbleBgView addSubview:label];
    
    
    bubbleBgView.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bubbleBgView attribute:NSLayoutAttributeTop multiplier:1 constant:10 + 37];
    [bubbleBgView addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bubbleBgView attribute:NSLayoutAttributeLeft multiplier:1 constant:10 + 6];
    [bubbleBgView addConstraint:contraint];

    contraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:bubbleBgView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    [bubbleBgView addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bubbleBgView attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    [bubbleBgView addConstraint:contraint];
    
    
    contraint = [NSLayoutConstraint constraintWithItem:bubbleBgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100];
    [self.view addConstraint:contraint];

    contraint = [NSLayoutConstraint constraintWithItem:bubbleBgView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:bubbleBgView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    [self.view addConstraint:contraint];

//    contraint = [NSLayoutConstraint constraintWithItem:bubbleBgView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
//    [self.view addConstraint:contraint];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

@end
