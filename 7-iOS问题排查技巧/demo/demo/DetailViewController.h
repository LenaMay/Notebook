//
//  DetailViewController.h
//  demo
//
//  Created by binluo on 16/8/15.
//  Copyright © 2016年 binluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

