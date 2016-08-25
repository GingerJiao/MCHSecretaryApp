//
//  SpecialDetailsViewContoller.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "SpecialDetailsViewContoller.h"

#import "RichHeadView.h"

#import "Header.h"

#import "DetailsInfoViewController.h"

#import "RecustomTableViewCell.h"

@implementation SpecialDetailsViewContoller

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    [super.navigationController setToolbarHidden:YES animated:TRUE];
    
    self.title = @"专题详情";
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    tableView.separatorStyle = 1;
    
    [self.view addSubview:tableView];
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RichHeadView *headView = [[RichHeadView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 200)];
    
    [headView loadHeadViewForSpecialDetailView];
    
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 DetailsInfoViewController *detailsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailsinfo"];
    
    [self.navigationController pushViewController:detailsVC animated:YES];
}
@end
