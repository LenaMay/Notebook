//
//  ALContentSizeViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-08.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALContentSizeViewController.h"

@interface ALContentSizeViewController ()

@property (nonatomic) UILabel *left1, *right1;
@property (nonatomic) UILabel *left2, *right2;
@property (nonatomic) UILabel *left3, *right3;
@property (nonatomic) UIStepper *stepper1, *stepper2, *stepper3;

@end

@implementation ALContentSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeSubviews];
    [self makeConstraints];
    [self makeActions];
}

- (void)makeSubviews {
    /* 1 */
    
    self.left1 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    });
    [self.view addSubview:self.left1];
    
    self.right1 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor grayColor];
        label;
    });
    [self.view addSubview:self.right1];
    
    self.stepper1 = [UIStepper new];
    [self.view addSubview:self.stepper1];
    
    /* 2 */
    
    self.left2 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    });
    [self.view addSubview:self.left2];
    
    self.right2 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor grayColor];
        label;
    });
    [self.view addSubview:self.right2];
    
    self.stepper2 = [UIStepper new];
    [self.view addSubview:self.stepper2];
    
    /* 3 */
    
    self.left3 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor blackColor];
        label;
    });
    [self.view addSubview:self.left3];
    
    self.right3 = ({
        UILabel *label = [UILabel new];
        label.text = @" [ttttextttt] ";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor grayColor];
        label;
    });
    [self.view addSubview:self.right3];
    
    self.stepper3 = [UIStepper new];
    [self.view addSubview:self.stepper3];
}

- (void)makeConstraints {
    [self.right1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                 forAxis:UILayoutConstraintAxisHorizontal];
    [self.right2 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                 forAxis:UILayoutConstraintAxisHorizontal];
    [self.right3 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                 forAxis:UILayoutConstraintAxisHorizontal];
    
    CGFloat const margin = 10.0;
    
    /* 1 */
    
    [self.left1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide).with.offset(margin);
        make.height.equalTo(@50);
    }];
    
    [self.right1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left1.mas_right);
        make.right.lessThanOrEqualTo(self.view);
        make.top.equalTo(self.left1);
        make.height.equalTo(self.left1);
    }];
    
    [self.stepper1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.left1.mas_bottom).with.offset(margin);
    }];
    
    /* 2 */
    
    [self.left2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.stepper1.mas_bottom).with.offset(margin);
        make.height.equalTo(self.left1);
    }];
    
    [self.right2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.left2.mas_right);
        make.right.equalTo(self.view);
        make.top.equalTo(self.left2);
        make.height.equalTo(self.left1);
    }];
    
    [self.stepper2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.left2.mas_bottom).with.offset(margin);
    }];
    
    /* 3 */
    
    [self.left3 setContentHuggingPriority:UILayoutPriorityRequired
                                  forAxis:UILayoutConstraintAxisVertical];
    
    [self.left3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.stepper2.mas_bottom).with.offset(margin);
        make.height.equalTo(self.left1);
    }];
    
    [self.right3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left3.mas_right);
        make.right.equalTo(self.view);
        make.top.equalTo(self.left3);
        make.height.equalTo(self.left1);
    }];
    
    [self.stepper3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.left3.mas_bottom).with.offset(margin);
    }];
}

- (void)makeActions {
    [self.stepper1 addTarget:self
                      action:@selector(updateLabel1WithStepper:)
            forControlEvents:UIControlEventValueChanged];
    [self.stepper2 addTarget:self
                      action:@selector(updateLabel2WithStepper:)
            forControlEvents:UIControlEventValueChanged];
    [self.stepper3 addTarget:self
                      action:@selector(updateLabel3WithStepper:)
            forControlEvents:UIControlEventValueChanged];
}

- (void)updateLabel1WithStepper:(UIStepper *)stepper {
    [self updateLabel:self.left1 stepper:stepper];
}

- (void)updateLabel2WithStepper:(UIStepper *)stepper {
    [self updateLabel:self.left2 stepper:stepper];
}

- (void)updateLabel3WithStepper:(UIStepper *)stepper {
    [self updateLabel:self.left3 stepper:stepper];
}

- (void)updateLabel:(UILabel *)label stepper:(UIStepper *)stepper {
    NSMutableString *text = [NSMutableString stringWithString:@" "];
    for (NSInteger i = 0; i < MAX(0, stepper.value) + 1; i++) {
        [text appendString:@"[ttttextttt] "];
    }
    label.text = text;
}

@end
