//
//  BJWebSocketClient.h
//  ObjC
//
//  Created by MingLQ on 2016-07-22.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BJWebSocketClientDelegate;

// BJWebSocketClientState
typedef NS_ENUM(NSInteger, BJWSCState) {
    BJWSCState_connecting,
    BJWSCState_connected,
    BJWSCState_disconnected
};

// BJWebSocketClientDisconnectReason
typedef NS_ENUM(NSInteger, BJWSCDisconnectReason) {
    BJWSCDisconnectReason_reconnect,
    BJWSCDisconnectReason_disconnect
};

typedef void (^BJWSCStateCallback)(BJWSCState state);

#pragma mark -

@interface BJWebSocketClient : NSObject <NSCopying>

@property (nonatomic, strong) BJWebSocketClient *webSocketClient;

@property (nonatomic, readonly) BJWSCState state;
@property (nonatomic, copy) BJWSCStateCallback stateCallback;
@property (nonatomic, weak) id<BJWebSocketClientDelegate> delegate;

- (void)connect;
- (void)disconnectWithReason:(BJWSCDisconnectReason)reason;

- (void)sendMessage:(NSString *)message;

@end

#pragma mark -

@protocol BJWebSocketClientDelegate <NSObject>

// ???: @property

@required

- (void)webSocketClient:(BJWebSocketClient *)webSocketClient
         stateDidChange:(BJWSCState)state;

@optional

- (void)webSocketClient:(BJWebSocketClient *)webSocketClient
         didSendMessage:(NSString *)message;

@end
