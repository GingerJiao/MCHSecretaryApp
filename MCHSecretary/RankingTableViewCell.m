//
//  RankingTableViewCell.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/25.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RankingTableViewCell.h"

@implementation RankingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.iconImage.layer setCornerRadius:20];
    self.iconImage.layer.masksToBounds = YES;
    
    [self.downBtn.layer setCornerRadius:5];
    self.downBtn.layer.masksToBounds = YES;
    
}
- (IBAction)downClicked:(id)sender
{
    NSLog(@"下载");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
