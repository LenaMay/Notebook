//
//  ALScrollViewController.h
//  Autolayout
//
//  Created by MingLQ on 2016-08-07.
//  Copyright © 2016年 GSX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALScrollViewController : UIViewController <UIScrollViewDelegate> {
@protected
    UIScrollView *_scrollView;
}

@property (nonatomic, readonly) UIScrollView *scrollView;

@end
