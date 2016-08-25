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

-(void)loadHeadViewForRecommandView
{
    //第一种区头
    _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (_num == 2)
    {
        _specialLab = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 40, 30)];
        
        _specialLab.text = @"专题";
        
        _specialLab.textAlignment = NSTextAlignmentCenter;
        
        _specialLab.textColor = [UIColor whiteColor];
        
        _specialLab.layer.borderColor = [UIColor clearColor].CGColor;
        
        _specialLab.layer.cornerRadius = 10;
        
        _specialLab.layer.borderWidth = 1;
        
        _specialLab.backgroundColor = [UIColor orangeColor];
        
        _specialLab.clipsToBounds = YES;
        
        [self addSubview:_specialLab];
        
        _imageButton.frame = CGRectMake(0, 40, self.frame.size.width, self.frame.size.height - 30);
        
        _textButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _textButton.frame = CGRectMake(100, 5, 100, 30);
        
        [_textButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_textButton setTitle:@"这是一个专题" forState:UIControlStateNormal];
        
        [self addSubview:_textButton];
    }
    else
    {
        _imageButton.frame = self.frame;
        
       
    }
    [_imageButton setTitle:@"加载图片" forState:UIControlStateNormal];
    
    [self addSubview:_imageButton];
}
-(void)loadHeadViewForRankingView
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
-(void)loadHeadViewForSpecialDetailView
{

    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, self.frame.size.height *0.5)];
    
    _imgView.backgroundColor = [UIColor cyanColor];
    
    [self addSubview:_imgView];
    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height *0.55, mScreenWidth, self.frame.size.height * 0.1)];
    
    _titleLab.textAlignment = NSTextAlignmentCenter;
    
    [_titleLab.text sizeWithFont:[UIFont systemFontOfSize:17]];
    
    _titleLab.text = @"这是标题";
    
    [self addSubview:_titleLab];
    
    _detailLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*0.6, mScreenWidth, self.frame.size.height * 0.5)];
    
    _detailLab.text = @"--------这是描述------------";
    
    _detailLab.textAlignment = NSTextAlignmentCenter;
    
    [_detailLab.text sizeWithFont:[UIFont systemFontOfSize:14]];
    
    [self addSubview:_detailLab];
}
@end
