//
//  BJWebSocketClient.m
//  ObjC
//
//  Created by MingLQ on 2016-07-22.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJWebSocketClient.h"
#import "BJWebSocketClient+BJProtected.h"

#import "BJCopyable.h"

@interface BJWebSocketClient ()

@property (nonatomic, strong) NSURL *serverURL;

@end

#pragma mark -

@implementation BJWebSocketClient

- (instancetype)init {
    self = [super init];
    if (self) {
        _state = BJWSCState_connecting;
    }
    return self;
}

- (void)connect {
    NSLog(@"%@ did connect server with url: %@", self, self.serverURL);
    
    self.state = BJWSCState_connected;
    if (self.stateCallback) {
        self.stateCallback(self.state);
    }
}

- (void)disconnectWithReason:(BJWSCDisconnectReason)reason {
    NSLog(@"%@ did disconnect server with reason: %td", self, reason);
    
    self.state = BJWSCState_disconnected;
    if (self.stateCallback) {
        self.stateCallback(self.state);
    }
}

- (void)sendMessage:(NSString *)message {
    // send
    NSLog(@"%@ did send message: %@", self, message);
    SEL selector = @selector(webSocketClient:didSendMessage:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate webSocketClient:self didSendMessage:message];
    }
}

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) copy = [[self class] new];
    copy.serverURL = self.serverURL;
    return copy;
}

@end
