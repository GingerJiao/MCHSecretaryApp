//
//  CWStarRateView.m
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import "CWStarRateView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"b27_icon_star_yellow"
#define BACKGROUND_STAR_IMAGE_NAME @"b27_icon_star_gray"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2

@interface CWStarRateView (){
    StarStyleType mStyleType;
}


@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;

@property (nonatomic, assign) NSInteger numberOfStars;


@end

@implementation CWStarRateView

#pragma mark - Init Methods
- (instancetype)init {
    NSAssert(NO, @"You should never call this method in this class. Use initWithFrame: instead!");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildDataAndUI];
        
        [self initStarConfig:StarStyle_Yellow];
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
//    if (self = [super initWithFrame:frame]) {
//        _numberOfStars = numberOfStars;
//        [self buildDataAndUI];
//    }
//    return self;
//}

-(void) initStarConfig:(StarStyleType)styleType{
    [self initStarConfig:styleType numberOfStars:DEFALUT_STAR_NUMBER];
}

-(void) initStarConfig:(StarStyleType)styleType numberOfStars:(NSInteger)numberOfStars{
    mStyleType = styleType;
    
    self.foregroundStarView = [self createStarViewWithImage:NO];
    self.backgroundStarView = [self createStarViewWithImage:YES];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
}

#pragma mark - Private Methods

- (void)buildDataAndUI {
    _scorePercent = 0;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = YES;//默认为YES
    _allowTouch = NO;
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    if(!_allowTouch){
        return;
    }
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    self.scorePercent = starScore / self.numberOfStars;
}

-(NSString *)starImageName:(BOOL)isBottom{
    NSString *starName = @"";
    NSLog(@"%d", mStyleType);
    switch (mStyleType) {
        case StarStyle_Gray:
            if (isBottom) {
                starName = @"star_gray_bottom";
            }else{
                starName = @"star_gray_upper";
            }
            break;
        case StarStyle_Yellow:
            if (isBottom) {
                starName = @"star_yellow_bottom";
            }else{
                starName = @"star_yellow_upper";
            }
            break;
        case StarStyle_Blue:
            if (isBottom) {
                starName = @"star_gray_bottom";
            }else{
                starName = @"star_blue_upper";
            }
            break;
        default:
            break;
    }
    return starName;
}

- (UIView *)createStarViewWithImage:(BOOL)isBottom {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    
    NSString *starName = [self starImageName:isBottom];
    if([@"" isEqualToString:starName]){
        view.backgroundColor = [UIColor blueColor];
    }else{
        view.clipsToBounds = YES;
        view.backgroundColor = [UIColor clearColor];
        for (NSInteger i = 0; i < DEFALUT_STAR_NUMBER; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:starName]];
            imageView.frame = CGRectMake(i * self.bounds.size.width / DEFALUT_STAR_NUMBER, 0, self.bounds.size.height, self.bounds.size.height);
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [view addSubview:imageView];
        }
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak CWStarRateView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
       weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

#pragma mark - Get and Set Methods

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:scroePercent];
    }
    
    [self setNeedsLayout];
}

@end
