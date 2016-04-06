//
//  JDRootScrollView.m
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import "JDRootScrollView.h"
#import "JDTopScrollView.h"
@interface JDRootScrollView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@end
@implementation JDRootScrollView

-(void)setContentViews:(NSArray *)contentViews {
    _contentViews = contentViews;
    [self initScrollView];
}
-(void)initScrollView {
    _selectIndex = -1;
    [_scrollView removeFromSuperview];
    UIScrollView *autoView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:autoView];
    _scrollView = autoView;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * self.contentViews.count, self.frame.size.height);
    
}
-(void)setSelectIndex:(NSInteger)selectIndex {
    if(selectIndex == _selectIndex)
        return;
    if (selectIndex > _selectIndex) {
        [self removeView:_selectIndex -1];
    }
    if (selectIndex < _selectIndex) {
        [self removeView:_selectIndex +1];
    }
    
    [self addView:selectIndex];

    if (labs(selectIndex - _selectIndex) > 2) {
        [self removeView:_selectIndex];
    }
    _selectIndex = selectIndex;
}
-(void)scrollToSelectView {
    [_scrollView setContentOffset:CGPointMake(_selectIndex*self.frame.size.width, _scrollView.contentOffset.y) animated:YES];
}
-(void)removeView:(NSInteger)index {
    if (index < 0 || index >=  self.contentViews.count) {
        return;
    }
    UIView *view = self.contentViews[index];
    [view removeFromSuperview];
}
-(void)addView:(NSInteger )index {
    if (index < 0) {
        index = 0;
    }
    if ( index >=  self.contentViews.count) {
        index = self.contentViews.count -1;
    }
    UIView *view = self.contentViews[index];
    if (!view.superview) {
        [_scrollView addSubview:view];
    }
}
#pragma --mark 
/** 滚动结束后调用（代码导致） */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 滚动标题栏
    self.topView.selectIndex = index;
    self.selectIndex = index;
    if ([_delegate respondsToSelector:@selector(JDRootScrollView:selectIndex:)]) {
        [_delegate JDRootScrollView:self selectIndex:index];
    }
}

/** 滚动结束（手势导致） */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSLog(@"222222222");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSLog(@"1111111111");
}
/** 正在滚动 */

@end
