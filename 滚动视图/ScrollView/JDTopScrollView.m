//
//  JDTopScrollView.m
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import "JDTopScrollView.h"
@interface JDTopScrollView ()
@property(nonatomic,weak)UIScrollView *scrollView;
@end


@implementation JDTopScrollView

-(void)setTitleViews:(NSArray *)titleViews {
    _titleViews = titleViews;
    [_scrollView removeFromSuperview];
    [self initScrollView];
}
-(void)initScrollView {
    _selectIndex = -1;
    UIScrollView *autoView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    autoView.showsHorizontalScrollIndicator = NO;
    autoView.showsVerticalScrollIndicator = NO;
    autoView.backgroundColor = [UIColor grayColor];
    [self addSubview:autoView];
    for (UIView *topView in self.titleViews) {
        [autoView addSubview:topView];
    }
    _scrollView = autoView;
    UIView *lastView = [self.titleViews lastObject];
    _scrollView.contentSize = CGSizeMake(lastView.frame.size.width +lastView.frame.origin.x, lastView.frame.size.height);
    
}
-(void)setSelectIndex:(NSInteger)selectIndex {
    if (selectIndex == _selectIndex) {
        return;
    }
    _selectIndex = selectIndex;
    UIView *topView = self.titleViews[_selectIndex];
    CGFloat offsetx = topView.center.x - self.scrollView.frame.size.width * 0.5;
    
    CGFloat offsetMax = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    
    CGPoint offset = CGPointMake(offsetx, self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:offset animated:YES];
}
@end
