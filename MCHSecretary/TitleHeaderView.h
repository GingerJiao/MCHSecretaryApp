//
//  TitleHeaderView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleHeaderView : UITableViewHeaderFooterView

+(instancetype) headerWithTableView:(UITableView *)tableView;

-(void) setTitleContent:(NSString *)title;

@end
