//
//  JDContentMoreView.h
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JDRootScrollViewDelegate;
@interface JDContentMoreView : UIView
@property(nonatomic)CGRect titleViewFrame;
@property(nonatomic)CGRect contentViewFrame;
@property(nonatomic,strong)NSArray *titleViews;
@property(nonatomic,strong)NSArray *contentViews;
@property(nonatomic)NSInteger selectIndex;
@property(nonatomic,weak)id<JDRootScrollViewDelegate>delegate;
-(void)resetView;//

@end
