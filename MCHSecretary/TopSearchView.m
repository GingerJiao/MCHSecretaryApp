//
//  TopSearchView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/4.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "TopSearchView.h"

#define BackColor [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1.0]
#define TextColor [UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:100 / 255.0 alpha:1.0]
#define LineColor [UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1.0]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface TopSearchView(){

    NSString *searchText;
}
@end

@implementation TopSearchView

-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.backgroundColor = [UIColor whiteColor];
        searchText = @"";
        
        [self initSubView];
    }
    return self;
}

-(void) initSubView{
//    int baseW = self.frame.size.width;
    int baseH = self.frame.size.height;
    int w = kScreenWidth - 15 - 60;
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(15, 10, w, 30)];
    backView.layer.cornerRadius = 15;
    [backView setBackgroundColor:BackColor];
    
//    UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *btnSearch = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, w - 35, 20)];
    [btnSearch setBackgroundColor:[UIColor clearColor]];
    [btnSearch setTitleColor:TextColor forState:UIControlStateNormal];
    btnSearch.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    NSString *searchTip = [NSString stringWithFormat:@"%@%@",NSLocalizedString(@"SearchContent", ""),@"奥运"];
    [btnSearch setTitle:searchTip forState:UIControlStateNormal];
    btnSearch.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnSearch addTarget:self action:@selector(toSearchView:) forControlEvents:UIControlEventTouchUpInside];
    
    [backView addSubview:btnSearch];
    
//    int searchX = CGRectGetMaxX(backView.frame) + 15;
    UIButton *btnSearchContent = [[UIButton alloc] initWithFrame:CGRectMake(w - 30, 5, 20, 20)];
    [btnSearchContent setBackgroundImage:[UIImage imageNamed:@"choice_search"] forState:UIControlStateNormal];
    [btnSearchContent addTarget:self action:@selector(setSearchContent:) forControlEvents:UIControlEventTouchUpInside];
    
    [backView addSubview:btnSearchContent];
    
    [self addSubview:backView];
    
    int bownX = CGRectGetMaxX(backView.frame) + 15;
    UIButton *downBtn = [[UIButton alloc] initWithFrame:CGRectMake(bownX, 13, 24, 24)];
    [downBtn setBackgroundImage:[UIImage imageNamed:@"choice_download"] forState:UIControlStateNormal];
    [downBtn addTarget:self action:@selector(toDownView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:downBtn];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, baseH - 1, kScreenWidth + 20, 1)];
    [lineView setBackgroundColor:LineColor];
    
    [self addSubview:lineView];
}

-(void) setSearchContent:(UIButton *)sender{
    searchText = @"奥运";
    [self showSearchListView];
}

-(void) toSearchView:(UIButton *)sender{
    searchText = @"";
    [self showSearchListView];
}

-(void) showSearchListView{
    NSLog(@"search content:%@", searchText);
    
    [self.delegate showSearchView:searchText];
}

-(void) toDownView:(UIButton *)sender{
    NSLog(@"download view");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
