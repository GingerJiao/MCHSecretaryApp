//
//  RecustomTableViewCell.h
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@property (weak, nonatomic) IBOutlet UIButton *nameButton;

@property (weak, nonatomic) IBOutlet UIButton *countButton;

@property (weak, nonatomic) IBOutlet UIButton *descriptBtn;

@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@end
