//
//  MyClass.h
//  demo
//
//  Created by binluo on 16/9/13.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyClassTestBlock)();

@interface MyClass : NSObject

@property (nonatomic, copy) MyClassTestBlock testBlock;

@end
