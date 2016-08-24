//
//  RichHeadView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RichHeadView.h"

#import "Header.h"

#define BtnWidth 80

@implementation RichHeadView
-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if (self)
    {
        float row = (mScreenWidth -320)/5;
        
        _obveFirstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _obveFirstBtn.backgroundColor = [UIColor orangeColor];
        
        _obveFirstBtn.tag = 11;
        
        [_obveFirstBtn setTitle:@"男生" forState:UIControlStateNormal];
        
        _obveFirstBtn.frame = CGRectMake(row, 10, BtnWidth, BtnWidth);
        
        [self addSubview:_obveFirstBtn];
        
        _obveSecondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _obveSecondBtn.tag = 12;
        
        _obveSecondBtn.backgroundColor = [UIColor orangeColor];
        
        [_obveSecondBtn setTitle:@"男生" forState:UIControlStateNormal];
        
        _obveSecondBtn.frame = CGRectMake((row *2 + BtnWidth), 10, BtnWidth, BtnWidth);
        
        [self addSubview:_obveSecondBtn];
        
        _obveThirdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _obveThirdBtn.tag = 13;
        
        _obveThirdBtn.backgroundColor = [UIColor orangeColor];
        
        [_obveThirdBtn setTitle:@"男生" forState:UIControlStateNormal];
        
        _obveThirdBtn.frame = CGRectMake((row *3 + BtnWidth * 2), 10, BtnWidth, BtnWidth);
        
        [self addSubview:_obveThirdBtn];
        
        _obveFouthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _obveFouthBtn.tag = 14;
        
        _obveFouthBtn.backgroundColor = [UIColor orangeColor];
        
        [_obveFouthBtn setTitle:@"男生" forState:UIControlStateNormal];
        
        _obveFouthBtn.frame = CGRectMake((row *4 + BtnWidth *3), 10, BtnWidth, BtnWidth);
        
        [self addSubview:_obveFouthBtn];
    }
    return self;
}
@end
