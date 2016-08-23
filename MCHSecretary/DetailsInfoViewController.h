//
//  DetailsInfoViewController.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/13.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppPacketInfo.h"
#import "CWStarRateView.h"
#import "DetailSegmentView.h"
#import "DetailDescribeView.h"
#import "DetailCommentView.h"


@interface DetailsInfoViewController : UIViewController
<
UIScrollViewDelegate,
DetailSegmentDeleget
>

@property (nonatomic, strong) AppPacketInfo *appInfo;


@property (weak, nonatomic) IBOutlet UIView *infoView;

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *appSmallIcon;

@property (weak, nonatomic) IBOutlet UILabel *appName;

@property (weak, nonatomic) IBOutlet CWStarRateView *appStarValue;

@property (weak, nonatomic) IBOutlet UILabel *appCommentNum;

@property (weak, nonatomic) IBOutlet UILabel *appDownAndSize;

@property (weak, nonatomic) IBOutlet DetailSegmentView *segmentView;

//@property (weak, nonatomic) IBOutlet UILabel *lblDescribe;
//@property (weak, nonatomic) IBOutlet UILabel *lblUpdateRecord;
//@property (weak, nonatomic) IBOutlet UILabel *lblVerision;
//
//@property (weak, nonatomic) IBOutlet UITextView *txtDescribe;
//@property (weak, nonatomic) IBOutlet UITextView *txtUpdateList;
//@property (weak, nonatomic) IBOutlet UITextView *txtVerision;




@end
