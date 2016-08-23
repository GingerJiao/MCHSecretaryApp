//
//  SearchViewController.m
//  MCHSecretary
//
//  Created by 朱进 on 16/8/12.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController

-(void) viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [super.navigationController setToolbarHidden:YES animated:TRUE];
    [super viewWillAppear:animated];
}

- (IBAction)btnBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
