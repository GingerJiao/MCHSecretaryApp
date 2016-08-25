//
//  NecessaryView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "NecessaryView.h"

#import "DetailsInfoViewController.h"

#import "APPViewController.h"

#import "Header.h"

#import "RecustomTableViewCell.h"

@implementation NecessaryView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
        
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
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == 0)
    {
        return 130;
    }
    return 140;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, mScreenWidth, 30)];
    
    label.text = @"这是类别的名字";
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.backgroundColor = [UIColor whiteColor];
    
    return label;
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
