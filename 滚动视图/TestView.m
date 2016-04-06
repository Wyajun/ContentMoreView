//
//  TestView.m
//  滚动视图
//
//  Created by 王亚军 on 15/10/9.
//  Copyright © 2015年 王亚军. All rights reserved.
//

#import "TestView.h"
#import "JDContentMoreView.h"
#import "JDRootScrollView.h"
@interface TestView ()<JDRootScrollViewDelegate>
@property(nonatomic,strong)JDContentMoreView *moreView;
@property(nonatomic,strong)UIButton *bnt;
@property(nonatomic,strong)NSArray *bnts;
@end


@implementation TestView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self testView];
    }
    return self;
}
-(void)testView {
    JDContentMoreView *content = [[JDContentMoreView alloc] initWithFrame:self.bounds];
    [self addSubview:content];
    content.titleViewFrame = CGRectMake(0, 0, self.frame.size.width, 60);
    content.contentViewFrame = CGRectMake(0, 65, self.frame.size.width, self.frame.size.height - 65);
    content.titleViews = [self titlViews];
    content.contentViews = [self contentViews];
    [content resetView];
    content.backgroundColor = [UIColor redColor];
    _moreView = content;
    [self bntPress:_bnts[0]];
    _moreView.delegate = self;

}
-(NSArray *)titlViews {
    NSMutableArray *titls = [NSMutableArray array];
    CGFloat width = 60;//self.frame.size.width/12;
    for (int i = 0; i < 12; i ++) {
        UIButton *bnt = [[UIButton alloc] init];
        [bnt setTitle:[NSString stringWithFormat:@"bnt%d",i] forState:UIControlStateNormal];
        bnt.frame = CGRectMake(width*i, 0, width, 60);
        [bnt addTarget:self action:@selector(bntPress:) forControlEvents:UIControlEventTouchUpInside];
        [bnt setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        bnt.tag = i ;
        [titls addObject:bnt];
    }
    _bnts = titls;
    return titls;
}
-(NSArray *)contentViews {
    NSMutableArray *contents = [NSMutableArray array];
    for (int i = 0; i < 12; i ++) {
        UILabel *bnt = [[UILabel alloc] init];
        bnt.frame = CGRectMake(self.frame.size.width*i, 0, self.frame.size.width,self.frame.size.height - 65 );
        bnt.text = [NSString stringWithFormat:@"lab%d",i];
        [contents addObject:bnt];
        
    }
    return contents;
}
-(void)bntPress:(UIButton *)bnt {
    if (bnt == _bnt) {
        return;
    }
    [self resetBnt:bnt];
    _moreView.selectIndex = bnt.tag;
    
}

-(void)resetBnt:(UIButton *)bnt {
    _bnt.selected = NO;
    bnt.selected = YES;
    _bnt = bnt;
}
-(void)JDRootScrollView:(JDRootScrollView *)rootScrollView selectIndex:(NSInteger)selectIndex {
    [self resetBnt:_bnts[selectIndex]];
}

@end
