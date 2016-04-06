//
//  JDContentMoreView.m
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import "JDContentMoreView.h"
#import "JDTopScrollView.h"
#import "JDRootScrollView.h"
@interface JDContentMoreView ()
@property(nonatomic,strong)JDRootScrollView *rootView;
@property(nonatomic,strong)JDTopScrollView *topView;
@end


@implementation JDContentMoreView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)resetView {
    
    self.topView.frame = self.titleViewFrame;
    self.rootView.frame = self.contentViewFrame;
    self.topView.titleViews = self.titleViews;
    self.rootView.contentViews = self.contentViews;
    self.rootView.topView = self.topView;
}
-(void)setDelegate:(id<JDRootScrollViewDelegate>)delegate {
    self.rootView.delegate = delegate;
}
-(JDTopScrollView *)topView {
    if(_topView) {
        return _topView;
    }
    _topView = [[JDTopScrollView alloc] init];
    [self addSubview:_topView];
    return _topView;
}
-(JDRootScrollView *)rootView {
    if (!_rootView) {
        _rootView = [[JDRootScrollView alloc] init];
    }
    [self addSubview:_rootView];
    return _rootView;
}
-(void)setSelectIndex:(NSInteger)selectIndex {
    self.topView.selectIndex = selectIndex;
    self.rootView.selectIndex = selectIndex;
    [self.rootView scrollToSelectView];
}
@end
