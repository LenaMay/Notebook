//
//  ALListViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-07.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <FLEX/FLEXManager.h>

#import "ALListViewController.h"

#import "ALHelloWorldViewController.h"
#import "ALHorizontalAlignmentViewController.h"
#import "ALVerticalAlignmentViewController.h"
#import "ALContentSizeViewController.h"
#import "ALAnimationViewController.h"
#import "ALLayoutViewController.h"
#import "ALLoginViewController.h"

@interface ALListItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic) Class viewControllerClass;

+ (instancetype)itemWithTitle:(NSString *)title viewControllerClass:(Class)viewControllerClass;

@end

@implementation ALListItem

+ (instancetype)itemWithTitle:(NSString *)title viewControllerClass:(Class)viewControllerClass {
    ALListItem *item = [ALListItem new];
    item.title = title;
    item.viewControllerClass = viewControllerClass;
    return item;
}

@end

#pragma mark -

@interface ALListViewController ()

@property (nonatomic, copy) NSArray<ALListItem *> *dataSource;

@end

@implementation ALListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Autolayout";
    
    self.navigationItem.rightBarButtonItem = ({
        [[UIBarButtonItem alloc] initWithTitle:@"FLEX"
                                         style:UIBarButtonItemStylePlain
                                        target:[FLEXManager sharedManager]
                                        action:@selector(toggleExplorer)];
    });
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    self.dataSource = @[ [ALListItem itemWithTitle:@"Hello World"
                               viewControllerClass:[ALHelloWorldViewController class]],
                         [ALListItem itemWithTitle:@"Horizontal Alignment"
                               viewControllerClass:[ALHorizontalAlignmentViewController class]],
                         [ALListItem itemWithTitle:@"Vertical Alignment"
                               viewControllerClass:[ALVerticalAlignmentViewController class]],
                         [ALListItem itemWithTitle:@"Content Size"
                               viewControllerClass:[ALContentSizeViewController class]],
                         [ALListItem itemWithTitle:@"Layout"
                               viewControllerClass:[ALLayoutViewController class]],
                         [ALListItem itemWithTitle:@"Animation"
                               viewControllerClass:[ALAnimationViewController class]],
                         [ALListItem itemWithTitle:@"Login"
                               viewControllerClass:[ALLoginViewController class]] ];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray *indexPaths = [self.tableView indexPathsForSelectedRows];
    for (NSIndexPath *indexPath in indexPaths) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:animated];
    }
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALListItem *item = (indexPath.row < self.dataSource.count
                        ? [self.dataSource objectAtIndex:indexPath.row]
                        : nil);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])
                                                            forIndexPath:indexPath];
    cell.textLabel.text = item.title;
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ALListItem *item = (indexPath.row < self.dataSource.count
                        ? [self.dataSource objectAtIndex:indexPath.row]
                        : nil);
    if ([item.viewControllerClass isSubclassOfClass:[UIViewController class]]) {
        UIViewController *viewController = [item.viewControllerClass new];
        viewController.navigationItem.title = item.title;
        viewController.navigationItem.rightBarButtonItem = ({
            [[UIBarButtonItem alloc] initWithTitle:@"FLEX"
                                             style:UIBarButtonItemStylePlain
                                            target:[FLEXManager sharedManager]
                                            action:@selector(toggleExplorer)];
        });
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
