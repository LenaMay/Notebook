//
//  BJMutableOnlyCopyable.m
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJMutableOnlyCopyable.h"

@implementation BJMutableOnlyCopyable

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone {
    BJMutableOnlyCopyable *copy = [[BJMutableOnlyCopyable alloc] init];
    copy.prop = self.prop;
    return copy;
}

@end
