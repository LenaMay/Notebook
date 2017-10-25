//
//  DetailViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "LeakViewController.h"
#import "MyClass.h"

typedef void(^TestBlock)();

@interface LeakViewController ()

@property (nonatomic, copy) TestBlock testBlock;
@property (nonatomic, strong) NSArray *array;

@end

@implementation LeakViewController

#pragma mark - Managing the detail item

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    // Update the user interface for the detail item.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setTestBlock:^() {
//        NSLog(@"%@", self);
//    }];
    
        MyClass *class = [MyClass new];
        [class setTestBlock:^() {
            NSLog(@"%@", self);
        }];
        self.array = @[class];
}

@end
