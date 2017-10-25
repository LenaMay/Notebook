//
//  CutomLabel.m
//  demo
//
//  Created by binluo on 16/8/16.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import "CutomLabel.h"

@implementation CutomLabel

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    
    return size;
//    return CGSizeMake(size.width + 100, size.height);
}

@end
