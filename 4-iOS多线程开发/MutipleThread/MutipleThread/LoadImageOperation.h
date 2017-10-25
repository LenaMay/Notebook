//
//  LoadImageOperation.h
//  MutipleThread
//
//  Created by Mac_ZL on 16/8/20.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LoadImageDelegate <NSObject>

-(void)loadImageFinish:(UIImage *) image;

@end

@interface LoadImageOperation : NSOperation

@property(nonatomic,copy) NSString *imgUrl;
@property(nonatomic,retain) id<LoadImageDelegate> loadDelegate;

@end
