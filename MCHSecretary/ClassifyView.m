//
//  ClassifyView.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/24.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ClassifyView.h"

#import "RichHeadView.h"

#import "RichTableViewCell.h"

#import "SpecialDetailsViewContoller.h"

#import "APPViewController.h"

#import "ClassifyDetailViewController.h"

@implementation ClassifyView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
        
        tableView.dataSource = self;
        
        tableView.delegate = self;
        
        tableView.separatorStyle = 0;
        
        [tableView registerClass:[RichTableViewCell class] forCellReuseIdentifier:@"cell"];
        
        [self addSubview:tableView];
    }
    return self;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RichTableViewCell *cell = [[RichTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    [cell.blowFirstBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowSecondBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowThirdBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowFouthBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowFifthBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowSixthBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.blowSeventhBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 200;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
-(void)buttonClicked:(UIButton *)clicked
{
            for (UIView *next=[self superview]; next; next=next.superview)
        {
            UIResponder *response=[next nextResponder];
            
            if ([response isKindOfClass:[APPViewController class]])
            {
                APPViewController *main= (APPViewController *)response;
                
                if (clicked.tag < 20)
                {
                    SpecialDetailsViewContoller *specialDetailVC = [[SpecialDetailsViewContoller alloc]init];
                    
                    [main.navigationController pushViewController:specialDetailVC animated:YES];
                }
                else
                {
                    ClassifyDetailViewController *classifyDetailVC = [[ClassifyDetailViewController alloc]init];
                    
                    [main.navigationController pushViewController:classifyDetailVC animated:YES];
                }
                
            }
        }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    RichHeadView *headView = [[RichHeadView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    
    [headView loadHeadViewForRankingView];
    
    [headView.obveFirstBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView.obveSecondBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView.obveThirdBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView.obveFouthBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return headView;
    
}
@end
