//
//  ChoiceViewController.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/8.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "ChoiceViewController.h"

#import "MJRefresh.h"

#import "NomalFrame.h"
#import "AppPacketInfo.h"
#import "ChoiceHeadeView.h"
#import "ChoiceListItem.h"
#import "CycleScrollCell.h"
#import "TitleHeaderView.h"

#import "ChoiceCycleAppRequest.h"

#import "DetailsInfoViewController.h"

#define TopViewHeight 100
#define FloatingViewHeight 40
#define CustomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BackColor CustomColor(240,240,240,1.0)

@interface ChoiceViewController (){
    ChoiceFloatView *floatview;
    BOOL floatviewIsShow;
}

@end

@implementation ChoiceViewController

@synthesize topView, choiceTableView, listItemArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    floatviewIsShow = false;
    listItemArray = [[NSMutableArray alloc] init];
    topView.delegate = self;
    
//    __unsafe_unretained UITableView *tableView = choiceTableView;
    choiceTableView.delegate = self;
    choiceTableView.dataSource = self;
    // 下拉刷新
    choiceTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self initData];
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    choiceTableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    choiceTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [choiceTableView.mj_footer endRefreshing];
        });
    }];
    
    CGFloat floatViewY = CGRectGetMaxY(topView.frame);
    
    floatview = [[ChoiceFloatView alloc] initWithFrame:CGRectMake(-4, floatViewY, [[UIScreen mainScreen] bounds].size.width + 4, FloatingViewHeight)];
    [floatview setBackgroundColor:BackColor];
    [floatview setDelegate:self];
    [self initData];
}

-(void) viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [super.navigationController setToolbarHidden:YES animated:TRUE];
    [super viewWillAppear:animated];
}

-(void) initData{
    
    [[[ChoiceCycleAppRequest alloc] init] getCycleAppInfo:^(NSMutableArray *result) {
//        NSLog(@"success dic:%@", dic);
        listItemArray = result;
        [choiceTableView reloadData];
        
        [choiceTableView.mj_header endRefreshing];
    } failure:^(NSURLResponse *response, NSError *error, NSDictionary *dic) {
        NSString *errorMsg = [NSString stringWithFormat:@"%@", [dic objectForKey:@"return_msg"]];
        NSLog(@"errorMsg:%@", errorMsg);
        
        [choiceTableView.mj_header endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return listItemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ChoiceListItem *listitem = listItemArray[section];
//    NSLog(@"%ld, %ld", (long)section, (long)listitem.itemNumber);
    if(listitem.cellType == CellStyle_Cycle){
        return 1;
    }
    return listitem.appInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoiceListItem *listitem = listItemArray[indexPath.section];
    if(listitem.cellType == CellStyle_Cycle){
        CycleScrollCell *cycleCell = [CycleScrollCell cellWithTableView:tableView];
//        [cycleCell setScrollFrame:listitem.imageURLArray];
        [cycleCell setScrollFrame:listitem.appInfoArray];
        [cycleCell setScrollViewDelegate:self];
        return cycleCell;
    }else{
        NomalCell *appcell = [NomalCell cellWithTableView:tableView];
        NomalFrame *frame = listitem.appInfoArray[indexPath.row];
        [appcell setNomalFrame:frame section:indexPath.section pos:indexPath.row];
        appcell.delegate = self;
        
        return appcell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoiceListItem *listitem = listItemArray[indexPath.section];
    if(listitem.cellType == CellStyle_Cycle){
        return TopViewHeight;
    }else{
        NomalFrame *frame = listitem.appInfoArray[indexPath.row];
        return frame.cellHeight;
    }
}

-(CGFloat)tableView:(UITableView *) tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.01;
    ChoiceListItem *listitem = listItemArray[section];
    if(listitem.cellType == CellStyle_Nomal){
        return FloatingViewHeight;
    }else if (listitem.cellType == CellStyle_Other){
        return 20;
    } else {
        return 0.1;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ChoiceListItem *listitem = listItemArray[section];
    if(listitem.cellType == CellStyle_Cycle){
        return nil;
    }else if (listitem.cellType == CellStyle_Other){
        TitleHeaderView *titleView = [TitleHeaderView headerWithTableView:tableView];
        [titleView setTitleContent:listitem.title];
        return titleView;
    } else {
        ChoiceHeadeView *headeView = [ChoiceHeadeView headerWithTableView:choiceTableView];
        [headeView setFloatViewDelegate:self];
        return headeView;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    MJExample *exam = self.examples[indexPath.section];
//    UIViewController *vc = [[exam.vcClass alloc] init];
//    vc.title = exam.titles[indexPath.row];
//    [vc setValue:exam.methods[indexPath.row] forKeyPath:@"method"];
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    DetailsInfoViewController *detailsView = [mainStoryboard instantiateViewControllerWithIdentifier:@"detailsinfo"];
    [self.navigationController pushViewController:detailsView animated:YES];
}

//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(floatview){
        if (scrollView.contentOffset.y <= TopViewHeight && scrollView.contentOffset.y >= 0) {
            //        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            if(floatviewIsShow){
                floatviewIsShow = NO;
                [floatview removeFromSuperview];
            }
        } else if (scrollView.contentOffset.y >= TopViewHeight) {
            //        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            if(!floatviewIsShow){
                floatviewIsShow = YES;
                [self.view addSubview:floatview];
            }
        }
    }
}

#pragma mark - ToSearchViewDelegate

-(void) showSearchView:(NSString *)searchText{
    [self performSegueWithIdentifier:@"choicetosearch" sender:self];
}

#pragma mark - DownloadAppDelegate

-(void) startDownloadApp:(NSInteger)section index:(NSInteger)index{
    if(listItemArray.count <= section){
        return;
    }
    ChoiceListItem *listitem = listItemArray[section];;
    
    NomalFrame *frame = [listitem.appInfoArray objectAtIndex:index];
    NSString *downUrl = frame.packetInfo.downloadUrl;
    NSLog(@"%ld_url: %@", (long)index, downUrl);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:downUrl]];
}

#pragma mark - CycleScrollItemDelegate

-(void) clickItem:(NSInteger)selectedIndex{
    NSLog(@"clickItem : %ld", (long)selectedIndex);
}

#pragma mark - ChoiceTopDelegate

-(void) choiceToNextView:(NSInteger)nextviewtype{
    NSLog(@"choiceToNextView : %ld", (long)nextviewtype);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     //Get the new view controller using [segue destinationViewController].
     //Pass the selected object to the new view controller.
}


@end
