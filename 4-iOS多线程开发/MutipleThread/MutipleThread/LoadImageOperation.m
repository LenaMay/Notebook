//
//  LoadImageOperation.m
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/20.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "LoadImageOperation.h"

@implementation LoadImageOperation
- (void)main {
    
    if (self.isCancelled) return;
    
    NSURL *url = [NSURL URLWithString:self.imgUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    if (self.isCancelled) {
        url = nil;
        imageData = nil;
        return;
    }
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    if (self.isCancelled) {
        image = nil;
        return;
    }
    
    if (self.loadDelegate!=nil&&[self.loadDelegate respondsToSelector:@selector(loadImageFinish:)]) {
        
        [(NSObject *)self.loadDelegate performSelectorOnMainThread:@selector(loadImageFinish:) withObject:image waitUntilDone:NO];
    }
    
}
@end
