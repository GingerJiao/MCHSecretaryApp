//
//  TitleHeaderView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "TitleHeaderView.h"

#define BackColor [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:0.6]

@interface TitleHeaderView(){
    UILabel *lblTitle;
}

@end
@implementation TitleHeaderView

+(instancetype) headerWithTableView:(UITableView *)tableView{
    NSString *identifier = @"";
    
    TitleHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if(!headerView){
        headerView = [[TitleHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return headerView;
}

-(instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width + 5, 20)];
        [view setBackgroundColor:BackColor];
        
        lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, view.bounds.size.width - 20, view.bounds.size.height)];
        [lblTitle setFont:[UIFont systemFontOfSize:12]];
        [lblTitle setTextColor:[UIColor blackColor]];
        [lblTitle setNumberOfLines:1];
        [lblTitle setTextAlignment:NSTextAlignmentLeft];
        [lblTitle setText:@""];
        
        [view addSubview:lblTitle];
        
        [self.contentView addSubview:view];
    }
    return self;
}

-(void) setTitleContent:(NSString *)title{
    [lblTitle setText:title];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
