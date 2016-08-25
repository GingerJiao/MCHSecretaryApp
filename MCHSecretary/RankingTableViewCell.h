//
//  RankingTableViewCell.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/25.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *rankImage;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *countLab;

@property (weak, nonatomic) IBOutlet UILabel *descriptLab;

@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@end
