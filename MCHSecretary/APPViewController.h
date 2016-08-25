//
//  APPViewController.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopSearchView.h"

@interface APPViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet TopSearchView *searchView;

@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;

@property(nonatomic,retain)UILabel *backLab;

@property(nonatomic,retain)UIView *baseView;

@end
