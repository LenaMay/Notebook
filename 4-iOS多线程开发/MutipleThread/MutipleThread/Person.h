//
//  Person.h
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/22.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic , strong) NSString *name;
@property (nonatomic , strong) NSString *sex;

- (void)personA;
- (void)personB;
- (void)removeAddress;
@end
