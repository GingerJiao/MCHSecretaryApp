//
//  DetailSegmentView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/15.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "DetailSegmentView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface DetailSegmentView(){
    UISegmentedControl *segmentView;
    
    NSArray *itemsArray;
}

@end

@implementation DetailSegmentView

@synthesize delegate;

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self initData];
        [self initView];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self initData];
        [self initView];
    }
    return self;
}

-(void) initData{
    NSString *firstItem = NSLocalizedString(@"SegmentFirst", @"");
    NSString *secondItem = NSLocalizedString(@"SegmentSecond", @"");
    NSString *thirdItem = NSLocalizedString(@"SegmentThird", @"");
    itemsArray = [[NSArray alloc]initWithObjects:firstItem, secondItem, thirdItem, nil];
    
}

-(instancetype) initWithFrame:(CGRect)frame items:(NSArray *)items{
    if(self = [super initWithFrame:frame]){
        itemsArray = items;
        [self initView];
    }
    return self;
}

-(void) initView{
    self.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.98];
    
    segmentView = [[UISegmentedControl alloc] initWithItems:itemsArray];
    segmentView.frame = CGRectMake(10, 5, kScreenWidth - 20, 29);
    [segmentView setTintColor:[UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1.0]];
    
    
    for (NSInteger i = 0; i < itemsArray.count; i++) {
        [segmentView setTitle:itemsArray[i] forSegmentAtIndex:i];
    }
    
    if(itemsArray.count > 0){
        segmentView.selectedSegmentIndex = 0;
        [segmentView addTarget:self action:@selector(changeSelectItem:) forControlEvents:UIControlEventValueChanged];
    }
    
    [self addSubview:segmentView];
}

-(void) changeSelectItem:(UISegmentedControl*)sender{
    [delegate changeSegmentItem:sender.selectedSegmentIndex];
}

-(void) setSelectSegement:(NSInteger)index{
    if(segmentView){
        segmentView.selectedSegmentIndex = index;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
