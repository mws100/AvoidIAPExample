//
//  KGInReviewVC.h
//  BankHelp
//
//  Created by 马文帅 on 16/7/8.
//  Copyright © 2016年 keguan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGInReviewVC : UIViewController
@property (nonatomic, copy) void(^completion)(BOOL isReview);
@end
