//
//  BJCopyable.m
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJCopyable.h"

@interface BJCopyable ()

// !!!: it won't be changed after init, only used for BJMutableCopyable
@property (nonatomic, readwrite) id prop;

@end

@implementation BJCopyable

- (instancetype)initWithProp:(id)prop {
    self = [super init];
    if (self) {
        _prop = prop;
    }
    return self;
}

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone {
    return self; // MRC: [self retain];
}

#pragma mark - <NSMutableCopying>

- (id)mutableCopyWithZone:(NSZone *)zone {
    BJMutableCopyable *copy = [[BJMutableCopyable alloc] init];
    copy.prop = self.prop;
    return copy;
}

@end

#pragma mark -

@implementation BJMutableCopyable

@dynamic prop;

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone {
    BJCopyable *copy = [[BJCopyable alloc] initWithProp:self.prop];
    return copy;
}

#pragma mark - <NSMutableCopying>

- (id)mutableCopyWithZone:(NSZone *)zone {
    BJMutableCopyable *copy = [[BJMutableCopyable alloc] init];
    copy.prop = self.prop;
    return copy;
}

@end
