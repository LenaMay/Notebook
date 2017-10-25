//
//  BJMutableOnlyCopyable.h
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJMutableOnlyCopyable : NSObject <NSCopying>

@property (nonatomic, readwrite) id prop;

@end
