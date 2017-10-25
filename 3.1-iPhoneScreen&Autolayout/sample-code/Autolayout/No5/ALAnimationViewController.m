//
//  ALAnimationViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-08.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALAnimationViewController.h"

static CGFloat const buttonSize = 100.0;

@interface ALAnimationViewController ()

@property (nonatomic) UIView *containerView;
@property (nonatomic) UIButton *button;

@end

@implementation ALAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeSubviews];
    [self makeConstraints];
    [self makeActions];
}

- (void)makeSubviews {
    UIView *containerView = [UIView new];
    self.containerView = containerView;
    [self.view addSubview:containerView];
    
    UIButton *button = [UIButton new];
    [button setTitle:@"变" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    self.button = button;
    [containerView addSubview:button];
}

- (void)makeConstraints {
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.width.height.equalTo(@(buttonSize));
    }];
}

- (void)makeActions {
    [self.button addTarget:self
                    action:@selector(animateWithButton:)
          forControlEvents:UIControlEventTouchUpInside];
}

- (void)animateWithButton:(UIButton *)button {
    button.selected = !button.selected;
    
    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.width.height.equalTo(button.selected ? self.containerView : @(buttonSize));
    }];
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}

@end
