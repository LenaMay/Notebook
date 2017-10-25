//
//  ALLayoutViewController.m
//  Autolayout
//
//  Created by MingLQ on 2017-01-10.
//  Copyright © 2017 GSX. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "ALLayoutViewController.h"

@interface ALLayoutViewController ()

@property (nonatomic) UIButton *buttonLT, *buttonLB, *buttonR;

@end

@implementation ALLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.alwaysBounceVertical = YES;
    
    [self makeSubviews];
    [self remakeConstraints];
    [self makeActions];
}

- (void)makeSubviews {
    self.buttonLT = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"3:4" forState:UIControlStateNormal];
        [button setTitle:@"4:3" forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor lightGrayColor];
        [self.scrollView addSubview:button];
        button;
    });
    
    self.buttonLB = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"3:4" forState:UIControlStateNormal];
        [button setTitle:@"4:3" forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        [self.scrollView addSubview:button];
        button;
    });
    
    self.buttonR = ({
        UIButton *button = [UIButton new];
        [button setTitle:@"3:4" forState:UIControlStateNormal];
        [button setTitle:@"4:3" forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor darkGrayColor];
        [self.scrollView addSubview:button];
        button;
    });
}

- (void)remakeConstraints {
    [self.buttonLT mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[ self.view, self.scrollView ]);
        make.top.equalTo(self.scrollView);
        make.width.equalTo(self.buttonLT.mas_height).multipliedBy(self.buttonLT.selected
                                                                  ? 4.0 / 3 : 3.0 / 4);
    }];
    
    [self.buttonLB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[ self.view, self.scrollView ]);
        make.top.equalTo(self.buttonLT.mas_bottom);
        make.width.equalTo(self.buttonLB.mas_height).multipliedBy(self.buttonLB.selected
                                                                  ? 4.0 / 3 : 3.0 / 4);
    }];
    
    [self.buttonR mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[ self.buttonLT.mas_right, self.buttonLB.mas_right ]);
        make.right.equalTo(@[ self.view, self.scrollView ]);
        make.top.equalTo(self.scrollView);
        make.bottom.equalTo(@[ self.buttonLB, self.scrollView ]);
        make.width.equalTo(self.buttonR.mas_height).multipliedBy(self.buttonR.selected
                                                                  ? 4.0 / 3 : 3.0 / 4);
    }];
}

- (void)makeActions {
    [self.buttonLT addTarget:self
                      action:@selector(updateButton:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.buttonLB addTarget:self
                      action:@selector(updateButton:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.buttonR addTarget:self
                     action:@selector(updateButton:)
           forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateButton:(UIButton *)button {
    button.selected = !button.selected;
    [self remakeConstraints];
}

@end
