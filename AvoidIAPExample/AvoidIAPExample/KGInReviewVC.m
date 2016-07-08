//
//  KGInReviewVC.m
//  BankHelp
//
//  Created by 马文帅 on 16/7/8.
//  Copyright © 2016年 keguan. All rights reserved.
//  

#import "KGInReviewVC.h"

@interface KGInReviewVC ()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@end

@implementation KGInReviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundImageView];
    
    //这两个时间根据自己的需求写，比如应用是7月1号提交的，一个月的时间，到7月30号足够能通过了
    //如果通过不了，则被拒时，修改这个时间
    [self checkDateFromDate:@"20160701000000" toDate:@"20160730235959"];
}

- (void)checkDateFromDate:(NSString *)fromDateStr toDate:(NSString *)toDateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *fromDate = [formatter dateFromString:fromDateStr];
    NSDate *toDate = [formatter dateFromString:toDateStr];
    
    if ([fromDate timeIntervalSinceNow] < 0 && [toDate timeIntervalSinceNow] > 0) {
        [self loadData];
    } else {
        [self checkStatus:NO];
    }
}

- (void)loadData {
//    //根据与服务器的协议，比如返回1为审核状态，0为普通状态，做判断
//    [HttpTool postWithURL:@"你的接口" params:nil success:^(id json) {
//        if ([json[@"code"] isEqual:@1]) {
//            [self checkStatus:YES];
//        } else {
//            [self checkStatus:NO];
//        }
//    } failure:^(NSError *error) {
//        //当服务器连不上时，可以根据自己的需求设置NO或YES，我这里设置成NO
//        [self checkStatus:NO];
//    }];
    
    //现在为了测试，随机返回
    [self checkStatus:arc4random()%2];
}

- (void)checkStatus:(BOOL)isReview {
    if (self.completion) {
        self.completion(isReview);
    }
}

- (UIImage *)getLaunchImage {
    NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    NSString *launchImage = nil;
    for (NSDictionary *dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, self.view.frame.size)) {
            launchImage = dict[@"UILaunchImageName"];
            return [UIImage imageNamed:launchImage];
        }
    }
    return nil;
}

#pragma mark - lazy init
- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithImage:[self getLaunchImage]];
        _backgroundImageView.frame = self.view.frame;
    }
    return _backgroundImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
