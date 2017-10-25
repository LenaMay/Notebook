//
//  LockDemoViewController.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/22.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "LockDemoViewController.h"
#import "Person.h"
@interface LockDemoViewController ()

- (IBAction)btnPressed:(UIButton *)sender;
@end

@implementation LockDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)btnPressed:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 1:
            [self threadSafe];
            break;
        case 2:
            [self lockDemo];
            break;
        case 3:
            [self synchronizedDemo];
            break;
        case 4:
            [self conditionLockDemo];
            break;
        case 5:
            [self semaporeDemo];
            break;
        case 6:
            [self recursiveDemo];
            break;
            
        default:
            break;
    }
}
- (void)threadSafe
{
    Person *person = [[Person alloc] init];
    //并发队列
    dispatch_queue_t q = dispatch_queue_create("removeAddress", DISPATCH_QUEUE_CONCURRENT);

    for (int i = 0; i < 3; ++i)
    {
        dispatch_async(q, ^{
            [person removeAddress];
        });
    }
    
}
- (void)lockDemo
{
    NSLock *myLock = [[NSLock alloc] init];
    Person *person = [[Person alloc] init];

    //线程A
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       [myLock lock];
        {
            [person removeAddress];
           // [NSThread sleepForTimeInterval:5];
        }
        [myLock unlock];
    });
    //线程B
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [myLock lock];
        [person removeAddress];
        [myLock unlock];
    });
}
- (void)conditionLockDemo
{
    // 线程A
    Person *person = [[Person alloc] init];

    NSConditionLock *conditionLock = [[NSConditionLock alloc] init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [conditionLock lock];
        //[conditionLock lockWhenCondition:0];
        [person removeAddress];
        [NSThread sleepForTimeInterval:5];
        /**
         *
         *  表示释放锁，同时把内部的condition设置为A条件
         */
        [conditionLock unlockWithCondition:10];
    });
    
    // 线程B
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /**
         *
         *  表示如果没有其他线程获得该锁，但是该锁内部的condition不等于A条件，它依然不能获得锁，仍然等待。
         *  如果内部的condition等于A条件，并且没有其他线程获得该锁，则进入代码区，同时设置它获得该锁
         */
        [conditionLock lockWhenCondition:5];
        [person removeAddress];
        [conditionLock unlock];
    });

}
- (void)recursiveDemo
{
    Person *person = [[Person alloc] init];
    // 创建锁对象
    NSRecursiveLock *theLock = [[NSRecursiveLock alloc] init];
    
    // 创建递归方法
    static void (^testCode)(int);
    testCode = ^(int value) {
        [theLock tryLock];
        if (value > 0)
        {
            [person removeAddress];
            [NSThread sleepForTimeInterval:1];
            testCode(value - 1);
        }
        [theLock unlock];
    };
    
    //线程A
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        testCode(5);
    });
    
    //线程B
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [theLock lock];
        [person removeAddress];
        [theLock unlock];
    });
}
- (void)synchronizedDemo
{
    Person *person = [[Person alloc] init];
    
    //线程A
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (person)
        {
            [person removeAddress];
            [NSThread sleepForTimeInterval:5];
        }
    });
    //线程B
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (person)
        {
            [person removeAddress];
        }
    });
}
- (void)semaporeDemo
{
    // 实例类person
    Person *person = [[Person alloc] init];
    
    // 创建并设置信量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    // 线程A
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [person removeAddress];
        [NSThread sleepForTimeInterval:5];
        dispatch_semaphore_signal(semaphore);
    });
    
    // 线程B
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [person removeAddress];
        dispatch_semaphore_signal(semaphore);
    });
}
@end
