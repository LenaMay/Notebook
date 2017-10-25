//
//  BJWebSocketClient+BJProtected.h
//  ObjC
//
//  Created by MingLQ on 2016-07-23.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJWebSocketClient.h"

@interface BJWebSocketClient ()

@property (nonatomic, readwrite) BJWSCState state;

@end

#pragma mark -

@interface BJWebSocketClient (BJProtected)

- (void)reconnect;

@end
