//
//  ALScrollViewController.m
//  Autolayout
//
//  Created by MingLQ on 2016-08-07.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALScrollViewController.h"

@interface ALScrollViewController ()

@property (nonatomic, readwrite) UIScrollView *scrollView;

@end

@implementation ALScrollViewController

@synthesize scrollView = _scrollView;
- (UIScrollView *)scrollView {
    if (![self isViewLoaded]) {
        [self view];
    }
    if (_scrollView) {
        return _scrollView;
    }
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self scrollView];
}

- (void)dealloc {
    _scrollView.delegate = nil;
}

@end
