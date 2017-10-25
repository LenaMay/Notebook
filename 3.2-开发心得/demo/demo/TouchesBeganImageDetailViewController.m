//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "TouchesBeganImageDetailViewController.h"

@interface TouchesBeganImageDetailViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation TouchesBeganImageDetailViewController

#pragma mark - Managing the detail item


- (void)configureView {
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textField = [[UITextField alloc] init];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100];
    [self.view addConstraint:contraint];

    contraint = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [self.view addConstraint:contraint];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}


@end
