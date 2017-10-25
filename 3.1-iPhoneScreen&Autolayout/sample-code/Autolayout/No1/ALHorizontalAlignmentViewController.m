//
//  ALHorizontalAlignmentViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-08.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALHorizontalAlignmentViewController.h"

static CGFloat const margin = 20.0, adjustment = 5.0, size = 50.0;

@implementation ALHorizontalAlignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeSubviewsAndConstraints];
}

- (void)makeSubviewsAndConstraints {
    /* single label */
    
    UILabel *singleLabel = [self labelWithText:@"0" superview:self.view];
    
    [singleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide).with.offset(margin);
        make.width.height.equalTo(@(size));
    }];
    
    /* three labels */
    
    UILabel *threeLabels_0 = [self labelWithText:@"0" superview:self.view];
    UILabel *threeLabels_1 = [self labelWithText:@"1" superview:self.view];
    UILabel *threeLabels_2 = [self labelWithText:@"2" superview:self.view];
    
    [threeLabels_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(singleLabel.mas_bottom).with.offset(margin);
        make.width.height.equalTo(singleLabel);
    }];
    
    [threeLabels_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(threeLabels_0.mas_left).with.offset(- margin);
        make.top.equalTo(threeLabels_0);
        make.width.height.equalTo(singleLabel);
    }];
    
    [threeLabels_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(threeLabels_0.mas_right).with.offset(margin);
        make.top.equalTo(threeLabels_0);
        make.width.height.equalTo(singleLabel);
    }];
    
    /* two labels */
    
    UIButton *ruler = [UIButton new];
    [self.view addSubview:ruler];
    UILabel *twoLabels_0 = [self labelWithText:@"0" superview:self.view];
    UILabel *twoLabels_1 = [self labelWithText:@"1" superview:self.view];
    
    [ruler mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(threeLabels_0.mas_bottom).with.offset(margin - adjustment);
        make.width.equalTo(@(margin));
        make.height.equalTo(singleLabel).with.sizeOffset(CGSizeMake(0, adjustment * 2));
    }];
    
    [twoLabels_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ruler.mas_left);
        make.top.equalTo(threeLabels_0.mas_bottom).with.offset(margin);
        make.width.height.equalTo(singleLabel);
    }];
    
    [twoLabels_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ruler.mas_right);
        make.top.equalTo(twoLabels_0);
        make.width.height.equalTo(singleLabel);
    }];
    
    [ruler addTarget:self
                action:@selector(updateButton:)
      forControlEvents:UIControlEventTouchUpInside];
    
    /* labels with container view */
    
    UIButton *containerView = [UIButton new];
    [self.view addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *prevLabel = nil;
    UIEdgeInsets containerInsets = UIEdgeInsetsMake(adjustment, adjustment, adjustment, adjustment);
    
    for (NSInteger i = 0; i < 4; i++) {
        UILabel *label = [self labelWithText:[@(i) stringValue] superview:containerView];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!prevLabel) {
                make.left.equalTo(containerView).with.insets(containerInsets);
            }
            else {
                make.left.equalTo(prevLabel.mas_right).with.offset(margin);
            }
            make.top.equalTo(ruler.mas_bottom).with.offset(margin);
            make.width.height.equalTo(singleLabel);
            
            make.top.bottom.equalTo(containerView).with.insets(containerInsets);
        }];
        prevLabel = label;
    }
    
    [prevLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).with.insets(containerInsets);
    }];
    
    [containerView addTarget:self
              action:@selector(updateButton:)
    forControlEvents:UIControlEventTouchUpInside];
    
    /* TODO: MingLQ - 等间距 (等宽 || 不等宽) |-[xxxx]-[xx]-[x]-| */
}

- (UILabel *)labelWithText:(NSString *)text superview:(UIView *)superview {
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    [superview addSubview:label];
    return label;
}

- (void)updateButton:(UIButton *)button {
    button.selected = !button.selected;
    button.backgroundColor = button.selected ? [UIColor redColor] : nil;
}

@end
