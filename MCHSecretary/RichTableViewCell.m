//
//  RichTableViewCell.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RichTableViewCell.h"

#import "Header.h"

#define BtnWidth 80

#define BtnHeight 80

@implementation RichTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
     [self addSubview];
    
    }
    return self;
}

-(void)addSubview
{
    float width = mScreenWidth/5;
    
    _blowFirstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowFirstBtn.backgroundColor = [UIColor orangeColor];
    
    _blowFirstBtn.tag = 21;
    
    [_blowFirstBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowFirstBtn.frame = CGRectMake(0, 10, width*2, width *2);
    
    [self addSubview:_blowFirstBtn];
    
    _blowSecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowSecondBtn.tag = 22;
    
    _blowSecondBtn.backgroundColor = [UIColor blueColor];
    
    [_blowSecondBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowSecondBtn.frame = CGRectMake(width *2 , 10, width, width);
    
    [self addSubview:_blowSecondBtn];
    
    _blowThirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowThirdBtn.tag = 23;
    
    _blowThirdBtn.backgroundColor = [UIColor grayColor];
    
    [_blowThirdBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowThirdBtn.frame = CGRectMake(width *3 , 10, width, width);
    
    [self addSubview:_blowThirdBtn];
    
    _blowFouthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowFouthBtn.tag = 24;
    
    _blowFouthBtn.backgroundColor = [UIColor cyanColor];
    
    [_blowFouthBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowFouthBtn.frame = CGRectMake(width *4 , 10, width, width);
    
    [self addSubview:_blowFouthBtn];
    
    _blowFifthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowFifthBtn.backgroundColor = [UIColor redColor];
    
    _blowFifthBtn.tag = 25;
    
    [_blowFifthBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowFifthBtn.frame = CGRectMake(width *2 , 10 + width, width, width);
    
    [self addSubview:_blowFifthBtn];
    
    _blowSixthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowSixthBtn.tag = 26;
    
    _blowSixthBtn.backgroundColor = [UIColor yellowColor];
    
    [_blowSixthBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowSixthBtn.frame = CGRectMake(width *3 , 10 + width, width, width);
    
    [self addSubview:_blowSixthBtn];
    
    _blowSeventhBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _blowSeventhBtn.tag = 27;
    
    _blowSeventhBtn.backgroundColor = [UIColor greenColor];
    
    [_blowSeventhBtn setTitle:@"男生" forState:UIControlStateNormal];
    
    _blowSeventhBtn.frame = CGRectMake(width *4 , 10 + width, width, width);
    
    [self addSubview:_blowSeventhBtn];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
