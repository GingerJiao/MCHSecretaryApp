//
//  ChoiceViewController.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/8.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopSearchView.h"
#import "NomalCell.h"
#import "CycleScrollerView.h"
#import "ChoiceFloatView.h"



@interface ChoiceViewController : UIViewController
<
    UITableViewDelegate,
    UITableViewDataSource,
    ToSearchViewDelegate,
    DownloadAppDelegate,
    CycleScrollItemDelegate,
    ChoiceTopDelegate
>


@property (strong, nonatomic) NSMutableArray *listItemArray;

@property (weak, nonatomic) IBOutlet TopSearchView *topView;

@property (weak, nonatomic) IBOutlet UITableView *choiceTableView;

@end
