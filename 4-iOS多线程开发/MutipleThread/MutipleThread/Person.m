//
//  Person.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/22.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic,strong) NSMutableArray *address;

@end

@implementation Person

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.address = [NSMutableArray arrayWithObjects:@"北京市海淀区后厂村路",nil];
    }
    return self;
    
}
//- (NSMutableArray *)address
//{
//    NSLog(@"address %@",_address);
//    return _address;
//}
- (void)personA
{
    [self printLog:@"personA"];
}
- (void)personB
{
    [self printLog:@"personB"];
}
- (void)printLog:(NSString *)method
{
    NSLog(@"****************\n mainthread:%@\n thread:%@\nmethod:%@",[NSThread mainThread],[NSThread currentThread],method);
}
- (void)removeAddress
{
    if (self.address.count > 0)
    {
        [self.address removeObjectAtIndex:0];
        NSLog(@"删除成功%@",_address);
    }
    else
    {
        
        NSLog(@"暂时没有地址可以删除%@",_address);
    }
    [self printLog:@"removeAddress"];
}
@end
