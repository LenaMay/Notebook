//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "LineDetailViewController.h"

@interface LineDetailViewController ()

@property (nonatomic, strong) UIView *horLine1;
@property (nonatomic, strong) UIView *horLine2;
@property (nonatomic, strong) UIView *verLine1;
@property (nonatomic, strong) UIView *verLine2;

@end

@implementation LineDetailViewController

#pragma mark - Managing the detail item

- (void)configureView {
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  iOS上如何正确的绘制一个像素的线？
    self.horLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 400, 1/[UIScreen mainScreen].scale)];
    self.horLine1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.horLine1];
    
    self.horLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, 370, 400, 1/[UIScreen mainScreen].scale)];
    self.horLine2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.horLine2];
    
    self.verLine1 = [[UIView alloc] initWithFrame:CGRectMake(101, 320, 1/[UIScreen mainScreen].scale, 100)];
    self.verLine1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.verLine1];
    
    self.verLine2 = [[UIView alloc] initWithFrame:CGRectMake(150, 320, 1/[UIScreen mainScreen].scale, 100)];
    self.verLine2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.verLine2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

@end
