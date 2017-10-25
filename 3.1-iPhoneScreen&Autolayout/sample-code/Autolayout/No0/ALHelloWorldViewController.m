//
//  ALHelloWorldViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-08.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALHelloWorldViewController.h"

@interface ALHelloWorldViewController ()

@property (nonatomic) UIView *containerView;
@property (nonatomic) UIView *leftTopView, *rightTopView, *leftBottomView, *rightBottomView;
@property (nonatomic) UIView *leftView, *rightView, *topView, *bottomView;
@property (nonatomic) UIView *centerView;

@end

@implementation ALHelloWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeSubviews];
    [self makeConstraints];
}

- (void)makeSubviews {
    self.containerView = [UIView new];
    [self.view addSubview:self.containerView];
    
    self.leftView = [self viewWithName:@"LY"];
    self.rightView = [self viewWithName:@"RY"];
    self.topView = [self viewWithName:@"TX"];
    self.bottomView = [self viewWithName:@"BX"];
    
    self.leftTopView = [self viewWithName:@"LT"];
    self.rightTopView = [self viewWithName:@"RT"];
    self.leftBottomView = [self viewWithName:@"LB"];
    self.rightBottomView = [self viewWithName:@"RB"];
    
    self.centerView = [self viewWithName:@"XY"]; 
}

- (UIView *)viewWithName:(NSString *)name {
    UILabel *label = [UILabel new];
    label.text = name;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    [self.containerView addSubview:label];
    return label;
}

- (void)makeConstraints {
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    CGFloat const size = 50.0;
    
    [self.leftTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.rightTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.leftBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.rightBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.width.height.equalTo(@(size));
    }];
}

@end
