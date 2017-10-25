//
//  BJWebSocketClient+BJEmoticonMessage.m
//  ObjC
//
//  Created by MingLQ on 2016-07-22.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import "BJWebSocketClient+BJEmoticonMessage.h"

@implementation BJWebSocketClient (BJEmoticonMessage)

- (void)sendEmoticon:(NSString *)emoticon {
    NSString *message = [self messageWithEmoticon:emoticon];
    [self sendMessage:message];
}

- (NSString *)messageWithEmoticon:(NSString *)emoticon {
    return [NSString stringWithFormat:@"<<%@>>", emoticon];
}

@end
