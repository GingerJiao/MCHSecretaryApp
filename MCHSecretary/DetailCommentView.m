//
//  DetailCommentView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/19.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "DetailCommentView.h"

#import "CWStarRateView.h"
#import "CurrentAppUtils.h"

#define GetFont(s) [UIFont systemFontOfSize:s]
#define TitleFont GetFont(18)
#define VersionFont GetFont(13)
#define GetColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define VersionColor GetColor(150,150,150,1.0)

@implementation DetailCommentView

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initSubView];
    }
    return self;
}

-(void) initSubView{
    int padding = 15;
    UIImageView *ivPoint = [[UIImageView alloc] initWithFrame:CGRectMake(5, padding + 7, 5, 5)];
    [ivPoint setImage:[UIImage imageNamed:@"signpoint.png"]];
    [self addSubview:ivPoint];
    
    UILabel *lblDescribe = [[UILabel alloc] init];
    [lblDescribe setFrame:CGRectMake(15, padding, 100, 20)];
    [lblDescribe setFont:TitleFont];
    [lblDescribe setTextColor:[UIColor blackColor]];
    [lblDescribe setNumberOfLines:1];
    [lblDescribe setText:NSLocalizedString(@"CurrentComment", @"")];
    [self addSubview:lblDescribe];
    
    CGFloat starY = CGRectGetMaxY(lblDescribe.frame) + padding;
    
    CWStarRateView *fixStar = [[CWStarRateView alloc] initWithFrame:CGRectMake(15, starY, 80, 10)];
    [fixStar initStarConfig:StarStyle_Yellow];
    [fixStar setScorePercent:1];
    [self addSubview:fixStar];
    
    CGFloat totalCommentX = CGRectGetMaxX(fixStar.frame) + padding;
    UILabel *lblStar = [[UILabel alloc] init];
    [lblStar setFrame:CGRectMake(totalCommentX, starY, 100, 20)];
    [lblStar setFont:VersionFont];
    [lblStar setTextColor:VersionColor];
    [lblStar setNumberOfLines:1];
    NSString *txtInfo = [NSString stringWithFormat:@"%@%@ · %@%@", NSLocalizedString(@"VersionNumber", @""), [CurrentAppUtils appVersion], @"2", NSLocalizedString(@"AppComment", @"")];
    [lblStar setText:txtInfo];
    [self addSubview:lblStar];
    
    
}

-(void) addStarArea:(CGFloat)startY{
    CWStarRateView *fixStar = [[CWStarRateView alloc] initWithFrame:CGRectMake(15, startY, 80, 10)];
    [fixStar initStarConfig:StarStyle_Yellow];
    [fixStar setScorePercent:1];
    [self addSubview:fixStar];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
