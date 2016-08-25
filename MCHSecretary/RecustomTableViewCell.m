//
//  RecustomTableViewCell.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RecustomTableViewCell.h"

#import "APPViewController.h"

#import "DetailsInfoViewController.h"

@implementation RecustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
    }
    return self;
}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self.iconImage.layer setCornerRadius:20];
    self.iconImage.layer.masksToBounds = YES;
    
    [self.downBtn.layer setCornerRadius:5];
    self.downBtn.layer.masksToBounds = YES;
    
    self.selectionStyle = 0;
}
- (IBAction)buttonClick:(id)sender
{
    NSLog(@"===下载");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
