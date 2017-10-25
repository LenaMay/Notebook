//
//  MASConstraint+inset.m
//  M9Dev
//
//  Created by MingLQ on 2016-07-07.
//  Copyright © 2016年 MingLQ <minglq.9@gmail.com>. All rights reserved.
//

#import "MASConstraint+inset.h"

@implementation MASConstraint (M9Dev)

- (MASConstraint *(^)(CGFloat))al_inset {
    return ^id(CGFloat inset) {
        self.insets = UIEdgeInsetsMake(inset, inset, inset, inset);
        return self;
    };
}

@end
