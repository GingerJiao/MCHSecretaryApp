//
//  CycleScrollCell.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollerView.h"

@interface CycleScrollCell : UITableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableView;

-(void) setScrollFrame:(NSMutableArray *)urlArray;

-(void) setScrollViewDelegate:(id<CycleScrollItemDelegate>)delegate;

@end
