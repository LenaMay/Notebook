//
//  ALVerticalAlignmentViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-07.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALVerticalAlignmentViewController.h"

typedef NS_ENUM(NSInteger, ALNo2VerticalAlignment) {
    ALNo2VerticalAlignmentTop,
    ALNo2VerticalAlignmentCenter,
    ALNo2VerticalAlignmentBottom,
    ALNo2VerticalAlignmentFill,
    _ALNo2VerticalAlignmentCount,
    _ALNo2VerticalAlignmentFirst = ALNo2VerticalAlignmentTop
};

static NSString * const ALNo2VerticalAlignmentName[_ALNo2VerticalAlignmentCount] = {
    @"top",
    @"center",
    @"bottom",
    @"fill"
};

static CGFloat const margin = 10.0;

#pragma mark -

@interface ALVerticalAlignmentViewController ()

@end

@implementation ALVerticalAlignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeSubviewsAndConstraints];
}

- (void)makeSubviewsAndConstraints {
    UIButton *containerView = [UIButton new];
    [self.view addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.height.equalTo(@200);
    }];
    
    UILabel *prevLabel = nil;
    for (ALNo2VerticalAlignment alignment = _ALNo2VerticalAlignmentFirst;
         alignment < _ALNo2VerticalAlignmentCount;
         alignment++) {
        
        UILabel *label = [UILabel new];
        label.text = ALNo2VerticalAlignmentName[alignment];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        [containerView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(prevLabel.mas_right ?: containerView).with.offset(margin);
            if (prevLabel) make.width.equalTo(prevLabel);
            
            if (alignment == ALNo2VerticalAlignmentTop
                || alignment == ALNo2VerticalAlignmentFill) {
                make.top.equalTo(containerView).with.offset(margin);
            }
            
            if (alignment == ALNo2VerticalAlignmentBottom
                || alignment == ALNo2VerticalAlignmentFill) {
                make.bottom.equalTo(containerView).with.offset(- margin);
            }
            
            if (alignment == ALNo2VerticalAlignmentCenter) {
                make.centerY.equalTo(containerView);
            }
            
            // make.height.greaterThanOrEqualTo(@50);
        }];
        
        prevLabel = label;
    }
    
    [prevLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).with.offset(- margin);
    }];
    
    [containerView addTarget:self
                      action:@selector(updateBackground:)
            forControlEvents:UIControlEventTouchUpInside];
    [containerView sendAction:@selector(updateBackground:)
                           to:self
                     forEvent:nil];
}

- (void)updateBackground:(UIButton *)button {
    button.selected = !button.selected;
    
    button.backgroundColor = button.selected ? [UIColor blackColor] : nil;
}

@end
