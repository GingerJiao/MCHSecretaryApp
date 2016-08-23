//
//  DialogTipView.m
//  Payment
//
//  Created by 朱进 on 16/6/2.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "DialogTipView.h"
#import "StringUtils.h"

#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height

@implementation DialogTipView


- (id)initWithFrame:(CGRect)frame
{
//    self = [super initWithFrame:frame];
//    int viewH = 30;
//    int viewW = 30;
//    self = [super initWithFrame:CGRectMake((kScreenW - viewW) / 2, (kScreenH - viewH) / 2, viewW, viewH) ];
    self = [super initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) ];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self addBackView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame tipStr:(NSString *)tip{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self addTipBackView:frame];
        
        if(![@"" isEqualToString:tip]){
            [self addTipStr:tip];
        }

    }
    return self;
}

-(void) addBackView{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake((kScreenW - 30)/2, (kScreenH - 30)/2, 30, 30)];
    [backView setBackgroundColor:[UIColor grayColor]];
    backView.layer.cornerRadius = 10;    //设置弹出框为圆角视图
    backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 2;   //设置弹出框视图边框宽度
    backView.layer.borderColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] CGColor];   //设置弹出框边框颜色
    [self addIndicatorActivity:backView];
    
    [self addSubview:backView];
}

-(void) addIndicatorActivity:(UIView *)backview{
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activity setCenter:CGPointMake(15, 15)];//指定进度轮中心点
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    //    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //    [activity setBackgroundColor:[UIColor lightGrayColor]];
    [activity startAnimating];
    [backview addSubview:activity];
}

-(void) addTipBackView:(CGRect)tipFrame{
    UIView *backView = [[UIView alloc] initWithFrame:tipFrame];
    [backView setBackgroundColor:[UIColor grayColor]];
    backView.layer.cornerRadius = 10;    //设置弹出框为圆角视图
    backView.layer.masksToBounds = YES;
    backView.layer.borderWidth = 2;   //设置弹出框视图边框宽度
    backView.layer.borderColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] CGColor];   //设置弹出框边框颜色
    [self addIndicatorActivity:backView];
    
    [self addSubview:backView];
}


-(void) addTipStr:(NSString *)tip{
    CGSize maxSize = CGSizeMake(kScreenW - 30, 20);
    CGSize descSize = [StringUtils sizeWithString:tip font:[UIFont systemFontOfSize:20] maxSize:maxSize];
    
    UILabel *lblTip = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, descSize.width, 30)];
    lblTip.text = tip;
    lblTip.font = [UIFont systemFontOfSize: 20];
    lblTip.textColor = [UIColor whiteColor];
    lblTip.numberOfLines = 1;
    lblTip.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lblTip];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
