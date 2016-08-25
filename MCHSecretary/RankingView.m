//
//  RankingView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "RankingView.h"

#import "DetailsInfoViewController.h"

#import "APPViewController.h"

@implementation RankingView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
        
        tableView.dataSource = self;
        
        tableView.delegate = self;
        
        tableView.separatorStyle = 1;
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [self addSubview:tableView];
    }
    
    return self;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = @"自定义单元格";
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
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
@end
