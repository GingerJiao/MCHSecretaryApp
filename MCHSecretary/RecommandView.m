//
//  RecommandView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/23.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RecommandView.h"

#import "NomalCell.h"

#import "Header.h"

#import "RichHeadView.h"

#import "DetailsInfoViewController.h"

#import "APPViewController.h"

#import "SpecialDetailsViewContoller.h"

#import "RecustomTableViewCell.h"

@implementation RecommandView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, mScreenHeight) style:UITableViewStyleGrouped];
        
        tableView.dataSource = self;
        
        tableView.delegate = self;
        
        tableView.separatorStyle = 1;

        [self addSubview:tableView];
        
    }
    
    return self;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    RecustomTableViewCell *cell = (RecustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RecustomTableViewCell class])
                                              owner:self
                                            options:nil] objectAtIndex:0];
    }
    
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RichHeadView *headView = [[RichHeadView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 150)];
    
    if (section != 0)
    {
        headView.num =2;
    }
    
    [headView loadHeadViewForRecommandView];
    
    [headView.textButton addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView.imageButton addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UIView *next=[self superview]; next; next=next.superview)
    {
        UIResponder *response=[next nextResponder];
        
        if ([response isKindOfClass:[APPViewController class]])
        {
            APPViewController *main= (APPViewController *)response;
            
            DetailsInfoViewController *detailsView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailsinfo"];
            
            [main.navigationController pushViewController:detailsView animated:YES];
        }
    }
}
-(void)buttonclick:(UIButton *)btn
{
    for (UIView *next=[self superview]; next; next=next.superview)
    {
        UIResponder *response=[next nextResponder];
        
        if ([response isKindOfClass:[APPViewController class]])
        {
            APPViewController *main= (APPViewController *)response;
            
            SpecialDetailsViewContoller *specialDetailVC = [[SpecialDetailsViewContoller alloc]init];
            
            [main.navigationController pushViewController:specialDetailVC animated:YES];
        }
    }

}
-(void)pushToDetailInfoViewController
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
