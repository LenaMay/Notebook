//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "ZombieViewController.h"
#import "MyClass.h"

@interface ZombieViewController ()

@property (nonatomic, assign) MyClass *obj;

@end

@implementation ZombieViewController

#pragma mark - Managing the detail item

- (void)dealloc {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@", self.obj);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.obj = [MyClass new];
    
    
}

@end
