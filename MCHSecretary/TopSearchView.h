//
//  TopSearchView.h
//  MCHSecretary
//
//  Created by 朱进 on 16/8/4.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToSearchViewDelegate <NSObject>

-(void) showSearchView:(NSString *)searchText;

@end

@interface TopSearchView : UIView


@property (nonatomic, weak) id<ToSearchViewDelegate> delegate;

@end
