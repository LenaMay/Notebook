//
//  BJWebSocketClient+BJProtected.m
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJWebSocketClient+BJProtected.h"

@implementation BJWebSocketClient (BJProtected)

- (void)reconnect {
    [self disconnectWithReason:BJWSCDisconnectReason_reconnect];
    [self connect];
}

@end
