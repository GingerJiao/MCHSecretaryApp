//
//  CWStarRateView.h
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CWStarRateView;

@protocol CWStarRateViewDelegate <NSObject>

@optional
- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent;

@end

typedef enum {
    StarStyle_Gray = 0,
    StarStyle_Yellow,
    StarStyle_Blue
}StarStyleType;

@interface CWStarRateView : UIView

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO
@property (nonatomic, assign) BOOL allowTouch;//是否允许点击，默认为yes 

@property (nonatomic, weak) id<CWStarRateViewDelegate> delegate;

//- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

-(void) initStarConfig:(StarStyleType)styleType numberOfStars:(NSInteger)numberOfStars;

-(void) initStarConfig:(StarStyleType)styleType;

@end