//
//  JDRootScrollView.h
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JDTopScrollView ;
@protocol JDRootScrollViewDelegate;
@interface JDRootScrollView : UIView
@property(nonatomic,strong)NSArray *contentViews;
@property(nonatomic,weak)JDTopScrollView *topView;
@property(nonatomic)NSInteger selectIndex;
@property(nonatomic,weak)id<JDRootScrollViewDelegate>delegate;
-(void)scrollToSelectView;
@end
@protocol JDRootScrollViewDelegate <NSObject>

-(void)JDRootScrollView:(JDRootScrollView *)rootScrollView selectIndex:(NSInteger)selectIndex;

@end