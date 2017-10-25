//
//  MasterViewController.m
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "MasterViewController.h"
#import "ZombieViewController.h"
#import "LeakViewController.h"

@interface TableViewCellItem : NSObject

@property (nonatomic, strong, nullable) NSString *title;

@property (nonatomic, copy, nullable) void (^handleBlock)(void) ;

+ (instancetype)itemWithTitle:(NSString *)title handleBlock:(nullable void (^)(void))handleBlock;

@end

@implementation TableViewCellItem

+ (instancetype)itemWithTitle:(NSString *)title handleBlock:(nullable void (^)(void))handleBlock {
    TableViewCellItem *item = [[TableViewCellItem alloc] init];
    item.title = title;
    item.handleBlock = handleBlock;
    return item;
}

@end


@interface MasterViewController ()

@property NSMutableArray *items;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.clearsSelectionOnViewWillAppear = YES;

    NSMutableArray *items = [NSMutableArray array];
    
    __typeof(self) weakSelf = self;
    TableViewCellItem *item = [TableViewCellItem itemWithTitle:@"Zombie" handleBlock:^{
        ZombieViewController *vc = [[ZombieViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [items addObject:item];
    
    item = [TableViewCellItem itemWithTitle:@"Leak" handleBlock:^{
        LeakViewController *vc = [[LeakViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [items addObject:item];
    
    self.items = items;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    TableViewCellItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCellItem *item = self.items[indexPath.row];
    if (item.handleBlock) {
        item.handleBlock();
    }
}

@end
