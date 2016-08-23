//
//  ChoiceHeadeView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/9.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol ChoiceTopDelegate <NSObject>
//
//-(void) choiceToNextView:(NSInteger)nextviewtype;
//
//@end


@interface ChoiceHeadeView : UITableViewHeaderFooterView

+(instancetype) headerWithTableView:(UITableView *)tableView;

-(void) setFloatViewDelegate:(id)delegete;

//@property (nonatomic, weak) id<ChoiceTopDelegate> delegate;

@end
