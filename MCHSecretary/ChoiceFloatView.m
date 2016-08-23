//
//  ChoiceFloatView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ChoiceFloatView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BackColor CustomColor(240,240,240,0.8)

#define TextSize 12
#define TitleFont [UIFont systemFontOfSize:TextSize]

@implementation ChoiceFloatView

-(id) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addButtonSubView];
    }
    return self;
}

-(void) addButtonSubView{
    int ivbtnWH = 25;
    int textW = TextSize * 2;
    int toppadding = (self.frame.size.height - ivbtnWH) / 2;
    int paddingS = 5;
    int paddingL = kScreenWidth - (ivbtnWH + paddingS + textW) * 4;
    if(paddingL <= 0){
        paddingL = 0;
        paddingS = 0;
    }
    
    float itemPadding = paddingL / 5.0f;
    //    NSLog(@"%f, %d, %f", kScreenWidth, paddingL, itemPadding);
    //精选
    UIButton *typeImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(itemPadding, toppadding, ivbtnWH, ivbtnWH)];
    [typeImageBtn setBackgroundImage:[UIImage imageNamed:@"choice_type"] forState:UIControlStateNormal];
    typeImageBtn.tag = 1;
    [typeImageBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:typeImageBtn];
    
    CGFloat typeTextX = CGRectGetMaxX(typeImageBtn.frame) + paddingS;
    UIButton *typeTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(typeTextX, toppadding, textW, ivbtnWH)];
    [typeTextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    typeTextBtn.titleLabel.font = TitleFont;
    typeTextBtn.titleLabel.numberOfLines = 1;
    [typeTextBtn setTitle:NSLocalizedString(@"ChoiceTopType", @"") forState:UIControlStateNormal];
    typeTextBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    typeTextBtn.tag = 1;
    [typeTextBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:typeTextBtn];
    
    //必备
    CGFloat necessaryImageX = CGRectGetMaxX(typeTextBtn.frame) + itemPadding;
    UIButton *necessaryImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(necessaryImageX, toppadding, ivbtnWH, ivbtnWH)];
    [necessaryImageBtn setBackgroundImage:[UIImage imageNamed:@"choice_necessary"] forState:UIControlStateNormal];
    necessaryImageBtn.tag = 2;
    [necessaryImageBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:necessaryImageBtn];
    
    CGFloat necessaryTextX = CGRectGetMaxX(necessaryImageBtn.frame) + paddingS;
    UIButton *necessaryTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(necessaryTextX, toppadding, textW, ivbtnWH)];
    [necessaryTextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    necessaryTextBtn.titleLabel.font = TitleFont;
    necessaryTextBtn.titleLabel.numberOfLines = 1;
    [necessaryTextBtn setTitle:NSLocalizedString(@"ChoiceTopNecessary", @"") forState:UIControlStateNormal];
    necessaryTextBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    necessaryTextBtn.tag = 2;
    [necessaryTextBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:necessaryTextBtn];
    
    // 榜单
    CGFloat listImageX = CGRectGetMaxX(necessaryTextBtn.frame) + itemPadding;
    UIButton *listImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(listImageX, toppadding, ivbtnWH, ivbtnWH)];
    [listImageBtn setBackgroundImage:[UIImage imageNamed:@"choice_list"] forState:UIControlStateNormal];
    listImageBtn.tag = 3;
    [listImageBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:listImageBtn];
    
    CGFloat listTextX = CGRectGetMaxX(listImageBtn.frame) + paddingS;
    UIButton *listTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(listTextX, toppadding, textW, ivbtnWH)];
    [listTextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    listTextBtn.titleLabel.font = TitleFont;
    listTextBtn.titleLabel.numberOfLines = 1;
    [listTextBtn setTitle:NSLocalizedString(@"ChoiceTopList", @"") forState:UIControlStateNormal];
    listTextBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    listTextBtn.tag = 3;
    [listTextBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:listTextBtn];
    
    //专题
    CGFloat subjectImageX = CGRectGetMaxX(listTextBtn.frame) + itemPadding;
    UIButton *subjectImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(subjectImageX, toppadding, ivbtnWH, ivbtnWH)];
    [subjectImageBtn setBackgroundImage:[UIImage imageNamed:@"choice_subject"] forState:UIControlStateNormal];
    subjectImageBtn.tag = 4;
    [subjectImageBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:subjectImageBtn];
    
    CGFloat subjectTextX = CGRectGetMaxX(subjectImageBtn.frame) + paddingS;
    UIButton *subjectTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(subjectTextX, toppadding, textW, ivbtnWH)];
    [subjectTextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subjectTextBtn.titleLabel.font = TitleFont;
    subjectTextBtn.titleLabel.numberOfLines = 1;
    [subjectTextBtn setTitle:NSLocalizedString(@"ChoiceTopSubject", @"") forState:UIControlStateNormal];
    subjectTextBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    subjectTextBtn.tag = 4;
    [subjectTextBtn addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:subjectTextBtn];
}

-(void) showNextView:(UIButton *)sender{
    [_delegate choiceToNextView:sender.tag];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
