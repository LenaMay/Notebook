//
//  ALLoginViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-07.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "MASConstraint+inset.h"

#import "ALLoginViewController.h"

static CGFloat const horMargin = 10.0, verMargin = 10.0, topMargin = 20.0, defaultHeiht = 44.0;

#pragma mark -

@interface ALNo1TextField : UITextField

@end

@implementation ALNo1TextField

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, horMargin, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end

#pragma mark -

@interface ALLoginViewController ()

@property (nonatomic) UILabel *copyrightLabel;
@property (nonatomic) UITextField *usernameTextField, *passwordTextField;
@property (nonatomic) UIButton *loginButton, *registerButton, *forgotPasswordButton;

@end

@implementation ALLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.alwaysBounceVertical = YES;
    
    [self makeSubviews];
    [self makeConstraints];
    [self makeActions];
}

- (void)makeSubviews {
    self.copyrightLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"Created by MingLQ";
        label.textColor = [UIColor lightGrayColor];
        label;
    });
    [self.scrollView addSubview:self.copyrightLabel];
    
    self.usernameTextField = ({
        UITextField *textField = [ALNo1TextField new];
        textField.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
        textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textField.layer.cornerRadius = 5;
        textField.placeholder = @"username";
        textField;
    });
    [self.scrollView addSubview:self.usernameTextField];
    
    self.passwordTextField = ({
        UITextField *textField = [ALNo1TextField new];
        textField.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
        textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textField.layer.cornerRadius = 5;
        textField.placeholder = @"password";
        textField.secureTextEntry = YES;
        textField;
    });
    [self.scrollView addSubview:self.passwordTextField];
    
    self.loginButton = ({
        UIButton *button = [UIButton new];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        [button setTitle:@"Login" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        button;
    });
    [self.scrollView addSubview:self.loginButton];
    
    self.registerButton = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"Register" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button;
    });
    [self.scrollView addSubview:self.registerButton];
    
    self.forgotPasswordButton = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"Forgot Password" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button;
    });
    [self.scrollView addSubview:self.forgotPasswordButton];
}

- (void)makeConstraints {
    [self.copyrightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.scrollView.mas_top);
        /* make.bottom.equalTo(self.mas_bottomLayoutGuide).with.offset(- verMargin); */
    }];
    
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView).with.offset(topMargin);
        // set self.scrollView.contentSize.width == self.view.mas_width
        make.left.right.equalTo(@[ self.view, self.scrollView ]).with.al_inset(horMargin);
        make.height.equalTo(@(defaultHeiht));
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.and.centerX.equalTo(self.usernameTextField);
        make.top.equalTo(self.usernameTextField.mas_bottom).with.offset(verMargin);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.and.centerX.equalTo(self.usernameTextField);
        make.top.equalTo(self.passwordTextField.mas_bottom).with.offset(verMargin);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginButton);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(verMargin);
    }];
    
    [self.forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginButton);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(verMargin);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        // set self.scrollView.contentSize.height == self.forgotPasswordButton.mas_bottom
        make.bottom.equalTo(self.forgotPasswordButton).with.offset(verMargin);
    }];
}

- (void)makeActions {
    [self.loginButton addTarget:self
                         action:@selector(loginWithButton:)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginWithButton:(UIButton *)button {
    NSLog(@"self.forgotPasswordButton.bottom: %f", CGRectGetMaxY(self.forgotPasswordButton.frame));
    NSLog(@"self.scrollView.contentSize: %@", NSStringFromCGSize(self.scrollView.contentSize));
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

@end
