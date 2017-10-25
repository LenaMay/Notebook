//
//  BJCopyable.h
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJCopyable : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, readonly) id prop;

- (instancetype)initWithProp:(id)prop;

@end

@interface BJMutableCopyable : BJCopyable

@property (nonatomic, readwrite) id prop;

@end
