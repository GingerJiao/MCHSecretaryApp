//
//  RecommandView.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NomalCell.h"

@interface RecommandView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *listItemArray;

@end
