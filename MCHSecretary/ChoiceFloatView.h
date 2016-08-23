//
//  ChoiceFloatView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/11.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoiceTopDelegate <NSObject>

-(void) choiceToNextView:(NSInteger)nextviewtype;

@end



@interface ChoiceFloatView : UIView

@property (nonatomic, weak) id<ChoiceTopDelegate> delegate;

@end
