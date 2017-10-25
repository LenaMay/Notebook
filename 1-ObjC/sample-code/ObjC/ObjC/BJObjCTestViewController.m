//
//  BJObjCTestViewController.m
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJObjCTestViewController.h"

@interface BJObjCTestViewController ()

@property (nonatomic, strong) BJWebSocketClient *webSocketClient;

@end

@implementation BJObjCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webSocketClient = ({
        BJWebSocketClient *client = [BJWebSocketClient new];
        client.delegate = self;
        client;
    });
}

- (void)printState:(BJWSCState)state {
    NSLog(@"%@ state did change: %td", self.webSocketClient, state);
}

#pragma mark - <BJWebSocketClientDelegate>

- (void)webSocketClient:(BJWebSocketClient *)webSocketClient
         stateDidChange:(BJWSCState)state {
    if ([super respondsToSelector:_cmd]) {
        [self webSocketClient:webSocketClient stateDidChange:state];
    }
    if ([self.superclass instanceMethodForSelector:_cmd]) {
        [self webSocketClient:webSocketClient stateDidChange:state];
    }
    NSLog(@"%@ state did change: %td", webSocketClient, state);
}

@end
