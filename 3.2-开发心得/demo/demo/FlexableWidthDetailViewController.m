//
//  FlexableWidthDetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "FlexableWidthDetailViewController.h"
#import "CutomLabel.h"

@interface FlexableWidthDetailViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation FlexableWidthDetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[CutomLabel alloc] init];
    self.label.backgroundColor = [UIColor redColor];
    self.label.text = @"5000000";
//    self.label.text = @"点点滴滴盛大开放门多萨了；奋斗史，阿福，阿迪开始费拉达斯怕浪费的萨跑理发店水力发电水力发电说了多少费拉达斯";
    self.label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.label];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
//    上间距 100
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100];
    [self.view addConstraint:contraint];
    
//    左间距 10
    NSLayoutConstraint *contraint1 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    [self.view addConstraint:contraint1];
    
//    宽度 64
    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:64];
    [self.label addConstraint:contraint2];

//    右间距 10
//    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
//    [self.view addConstraint:contraint2];
    
//    设置宽度 <= 100
//    NSLayoutConstraint *contraint2 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
//    [self.label addConstraint:contraint2];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@", self.label);
}

@end
