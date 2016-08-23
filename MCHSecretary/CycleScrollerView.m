//
//  CycleScrollerView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/10.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "CycleScrollerView.h"

#import "StringUtils.h"

#define ImageView_StartTag     1000
#define RollingTime 2.0

@interface CycleScrollerView(){
    UIScrollView *scrollView;
    
    UIPageControl *pageControl;
    
    NSMutableArray *imageArray;
    
    NSInteger currentPage;
    NSInteger totalPage;
    
    BOOL enableRolling;
    NSTimeInterval rollingDelayTime;
    
    // 下载统计
    NSInteger totalCount;
}

@end

@implementation CycleScrollerView

@synthesize  delegate;

-(id) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self addScrollView];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self addScrollView];
    }
    return self;
}

-(void) addScrollView{
    currentPage = 0;
    totalPage = 0;
    rollingDelayTime = RollingTime;
    imageArray = [[NSMutableArray alloc] init];
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    [self addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3, scrollView.frame.size.height);
    
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollView.frame.size.width * i, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = ImageView_StartTag + i;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [imageView addGestureRecognizer:singleTap];
        
        [scrollView addSubview:imageView];
    }
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.frame.size.width - 60)/2, self.frame.size.height - 15, 60, 15)];
    pageControl.numberOfPages = totalPage;
    [self addSubview:pageControl];
    
    pageControl.currentPage = currentPage;
}

-(void) setImageArray:(NSMutableArray *)array{
    if(array.count != imageArray.count){
        imageArray = [[NSMutableArray alloc] initWithArray:array];
        totalPage = imageArray.count;
        totalCount = totalPage;
        pageControl.numberOfPages = totalPage;
//        NSLog(@"totalPage:%ld", (long)totalPage);
        [self refreshScrollView];
    }
}

-(void) addSubImageView:(NSString *)imageurl{
    [imageArray addObject:imageurl];
    totalPage = imageArray.count;
    pageControl.numberOfPages = totalPage;
    totalCount = totalPage;
}

- (void)refreshScrollView {
    if(totalPage > 0){
        NSArray *curimageUrls = [self getDisplayImagesWithPageIndex];
        
        for (NSInteger i = 0; i < 3; i++)
        {
            UIImageView *imageView = (UIImageView *)[scrollView viewWithTag:ImageView_StartTag+i];
            NSString *url = [curimageUrls objectAtIndex:i];
            if (imageView && [imageView isKindOfClass:[UIImageView class]] && ![StringUtils isBlankString:url])
            {
                [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
            }else{
                NSLog(@"imageView is null");
            }
        }
        
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
        
        pageControl.currentPage = currentPage;
        
        [self startDownloadImage];
    }else{
        NSLog(@"image array count is 0");
    }
}

- (NSArray *)getDisplayImagesWithPageIndex {
    NSInteger pre = [self getPageIndex:currentPage - 1];
    NSInteger last = [self getPageIndex:currentPage + 1];
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:0];
    
    [images addObject:[imageArray objectAtIndex:pre]];
    [images addObject:[imageArray objectAtIndex:currentPage]];
    [images addObject:[imageArray objectAtIndex:last]];
    
    return images;
}

- (NSInteger)getPageIndex:(NSInteger)index {
    if (index < 0) {
        index = totalPage - 1;
    }
    
    if (index >= totalPage) {
        index = 0;
    }
    
    return index;
}

- (void)startDownloadImage {

//    [[SDWebImageManager sharedManager] cancelAll];
    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];

    for (NSInteger i = 0; i < imageArray.count; ++i) {
        NSString *url = [imageArray objectAtIndex:i];
        
        if (![StringUtils isBlankString:url]) {
            [downloader downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    totalCount--;
                    if (totalCount == 0) {
                        [self startRolling];
                    }
                });
                
            }];
        }
    }
}


#pragma mark UIScrollViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //取消已加入的延迟线程
    [self stopRolling];
}
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    NSInteger x = aScrollView.contentOffset.x;
//    NSInteger y = aScrollView.contentOffset.y;
    //NSLog(@"did  x=%d  y=%d", x, y);

    // 往下翻一张
    if (x >= 2 * scrollView.frame.size.width) {
        currentPage = [self getPageIndex:currentPage + 1];
        [self refreshScrollView];
    }
    
    if (x <= 0) {
        currentPage = [self getPageIndex:currentPage - 1];
        [self refreshScrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
    scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
    
    [self restartRolling];
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    [delegate clickItem:currentPage];
}

-(void) startRolling{
    if (!imageArray || imageArray.count == 1) {
        return;
    }
    [self stopRolling];
    
//    NSLog(@"startRolling");
    enableRolling = YES;
    [self performSelector:@selector(rollingScrollAction) withObject:nil afterDelay:rollingDelayTime inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
}

-(void) stopRolling{
    if(enableRolling){
//        NSLog(@"stopRolling");
        enableRolling = NO;
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rollingScrollAction) object:nil];
    }
}

-(void) restartRolling{
    [self stopRolling];
    
    [self startRolling];
}

-(void)rollingScrollAction {
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    [UIView animateWithDuration:0.25 animations:^{
        scrollView.contentOffset = CGPointMake(1.99 * scrollView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            currentPage = [self getPageIndex:currentPage + 1];
            [self refreshScrollView];
            
            [self restartRolling];
        }
    }];
}

- (void)dealloc {
//    delegate = nil;
    [self stopRolling];
    [[SDWebImageManager sharedManager]  cancelAll];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
