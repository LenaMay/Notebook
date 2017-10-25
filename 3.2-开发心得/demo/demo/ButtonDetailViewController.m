//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "ButtonDetailViewController.h"

@interface ButtonDetailViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ButtonDetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setImage:[UIImage imageNamed:@"Details-Btn-Follow-Normal"] forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"Details-Btn-Follow-Selected"] forState:UIControlStateHighlighted];
    
    [self.btn setImage:[UIImage imageNamed:@"Details-Btn-Follow-Selected"] forState:UIControlStateNormal | UIControlStateSelected];
    [self.btn setImage:[UIImage imageNamed:@"Details-Btn-Follow-Normal"] forState:UIControlStateHighlighted | UIControlStateSelected];
    
    [self.btn addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100];
    [self.view addConstraint:contraint];
    
    contraint = [NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100];
    [self.view addConstraint:contraint];
}

- (void)touchUpInsideAction:(id)sender {
    self.btn.selected = !self.btn.selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

@end
