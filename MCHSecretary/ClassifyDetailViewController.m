//
//  ClassifyDetailViewController.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ClassifyDetailViewController.h"

#import "RecustomTableViewCell.h"

#import "APPViewController.h"

#import "DetailsInfoViewController.h"

#import "Header.h"



#define BTNHEIGHT 30

#define BTNWIDTH 80

@implementation ClassifyDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    [super.navigationController setToolbarHidden:YES animated:TRUE];
    
    self.title = @"影音娱乐";
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
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    return [self createHeadView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    RecustomTableViewCell *cell = (RecustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RecustomTableViewCell class])
            owner:self options:nil] objectAtIndex:0];
    }
    
    cell.selectionStyle = 0;
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 140;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsInfoViewController *detailsView = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailsinfo"];
            
    [self.navigationController pushViewController:detailsView animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UIView *)createHeadView
{
    float row = 10;
    
    float line = 10;
    
    float btnWidth = (mScreenWidth -5 * row)/4;
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth- 40, BTNHEIGHT *3 + line * 4)];
    
    backgroundView.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:@"视频",@"电影",@"音乐",@"搞笑",@"动漫",@"铃声",@"短视频",@"播放器",@"K歌",@"VP/AR",@"直播", nil];
    
    for (int a = 0; a < 11; a++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.backgroundColor = [UIColor grayColor];
        
        [button setTitle:titleArr[a] forState:UIControlStateNormal];
        
        [button.layer setCornerRadius:5];
        
        [button.layer setMasksToBounds:YES];
        
        [button.layer setBorderColor:[UIColor blackColor].CGColor];
        
        button.frame = CGRectMake((row + (row + btnWidth) )* (a%4), (10 + 40 *(a/4)),btnWidth, BTNHEIGHT);
        
        button.tag = a;
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [backgroundView addSubview:button];
        
    }
     return backgroundView;
}
-(void)buttonClicked:(UIButton *)button
{
    
    NSLog(@"=======%ld",(long)button.tag);
}

@end
