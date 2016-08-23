//
//  ChoiceHeadeView.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ChoiceHeadeView.h"

#import "ChoiceFloatView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BackColor CustomColor(240,240,240,0.8)
//
//#define TextSize 12
//#define TitleFont [UIFont systemFontOfSize:TextSize]

ChoiceFloatView *floatView;

@implementation ChoiceHeadeView

+(instancetype) headerWithTableView:(UITableView *)tableView{
    static NSString *headeId = @"choiceheader";
    
    ChoiceHeadeView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headeId];
    if (!headerView) {
        headerView = [[ChoiceHeadeView alloc] initWithReuseIdentifier:headeId];
    }
    return headerView;
}

-(instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        [self.contentView setBackgroundColor:BackColor];
        
        [self addButtonView];
    }
    return self;
}

-(void) addButtonView{
    floatView = [[ChoiceFloatView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    [self.contentView addSubview:floatView];
}

-(void) setFloatViewDelegate:(id)dele{
    floatView.delegate = dele;
}
//-(void) showNextView:(UIButton *)sender{
//    [_delegate choiceToNextView:sender.tag];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
