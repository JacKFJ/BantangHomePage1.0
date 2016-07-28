//
//  SPScrollVwModel.m
//  SPCollectionViewModel
//
//  Created by mac on 6/20/16.
//  Copyright © 2016 mac. All rights reserved.

/*================= 我的错误点 =================*/
//        设置UIButton上字体的颜色设置UIButton上字体的颜色，不是用：
//        [btn.titleLabel setTextColor:[UIColorblackColor]];
//        btn.titleLabel.textColor=[UIColor redColor];
//        而是用：
//        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
/*=================  =================*/

#import "SPScrollVwModel.h"
#import "UIView+NJ.h"
#import "AppDelegate.h"
#import "SPRedViewModel.h"


@interface SPScrollVwModel ()<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger selected;

@end

@implementation SPScrollVwModel

+(instancetype) scrollVwModelWithTitle:(NSArray<NSString * > * )titles changeColor:(BOOL)changeColor changeFont:(BOOL) changeFont fontSize: (NSInteger)fontSize scaleSize:(NSInteger) scaleSize
{
    SPScrollVwModel * SSVM = [[self alloc]init];
    SSVM.changeColor = changeColor;
    SSVM.changeFont = changeFont;
    SSVM.fontSize = fontSize;
    SSVM.scaleSize = scaleSize;
    SSVM.titles = titles;
    return SSVM;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        [self setUpUIFirst];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
        [self setUpUIFirst];
    return self;
}
-(void) setUpUIFirst
{
    self.backgroundColor =[UIColor whiteColor];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator =NO;
    self.bounces = NO;
    self.tag =1000;
    self.delegate = self;
    AppDelegate * dele =[UIApplication sharedApplication].delegate;
    [dele addObserver:self forKeyPath:@"keyindex" options: NSKeyValueObservingOptionNew context:@"产生新值了"];
}
-(void)setTitles:(NSArray<NSString *> *)titles
{
    _titles = titles;
    [titles enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * stop) {
        UIButton * btn = [UIButton new];
        btn.adjustsImageWhenHighlighted = NO;
        [btn setTitle:obj forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize+self.scaleSize]];
        [btn sizeToFit];
        
        btn.tag = self.subviews.count;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize]];
        /*=================  =================*/
        
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        
        /*=================  =================*/
        if(btn.tag ==0)
        {
            if(self.changeColor) [btn setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
            //                [btn.titleLabel setTextColor:[UIColor redColor]];
            if(self.changeFont) [btn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize+self.scaleSize]];
        }
        [self addSubview:btn];
        [btn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    [self setUpFrame];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSString * idxstr = change[@"new"];
    UIButton * selectedBtn = [self viewWithTag:idxstr.integerValue];
    self.redView.isTONGBU = NO;
    [self clickSelectBtn:selectedBtn];
}
//一拖动就调用,好烦啊
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
-(void)setUpFrame
{
    CGFloat margin = 10;
    CGFloat maxX = margin;
    for (int i = 0; i < self.titles.count; ++i) {
        UIButton * btn = [self viewWithTag:i];
        btn.x = maxX;
        btn.y = 0;
        btn.height = 37;
        maxX = CGRectGetMaxX(btn.frame)+margin;
        //        NSLog(@"%@",NSStringFromCGRect(btn.frame));
    }
    self.contentSize = CGSizeMake(maxX, 0);
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
//    NSLog(@"%s", __FUNCTION__);
    [self.redView frameAnimatonWithIndex:self.selected];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIButton * curBtn = [self viewWithTag:self.selected];
    CGFloat redViewOffsetX = curBtn.frame.origin.x - self.contentOffset.x;
    [self.redView frameAnimaton:redViewOffsetX];
}
//-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    //    UIButton * curBtn = [self viewWithTag:self.selected];
//    //    CGFloat redViewOffsetX = curBtn.frame.origin.x - self.contentOffset.x;
//    ////    [self.redView frameAnimaton:redViewOffsetX];
//    NSLog(@"%s", __FUNCTION__);
//    [self.redView frameAnimatonWithIndex:self.selected];
//    
//}

-(void) ScrollToSelectedBtn: (NSInteger) selected
{
    if(self.selected == selected) return;
    
    UIButton * nextBtn = [self viewWithTag:selected];
    UIButton * curBtn = [self viewWithTag:self.selected];
    
    CGFloat offsetX = nextBtn.center.x - self.bounds.size.width/2;
    if(offsetX<0)
        offsetX =0;
    if(offsetX>self.contentSize.width-self.bounds.size.width)
        offsetX =self.contentSize.width-self.bounds.size.width;
    if(self.bounds.size.width ==0) offsetX =0;
    self.selected =selected;
    self.redView.isTONGBU = NO;
    if(self.contentOffset.x != offsetX)
        [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    else
        [self.redView frameAnimatonWithIndex:self.selected];

    
    //        设置UIButton上字体的颜色设置UIButton上字体的颜色，不是用：
    //        [btn.titleLabel setTextColor:[UIColorblackColor]];
    //        btn.titleLabel.textColor=[UIColor redColor];
    //        而是用：
    //        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    if(self.changeColor)
    {
        [curBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    if(self.changeFont)
    {
        [curBtn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize]];
        [nextBtn.titleLabel setFont:[UIFont systemFontOfSize:self.fontSize+self.scaleSize]];
    }
}

-(void) clickSelectBtn:(UIButton *) btn
{
    //    NSLog(@"%s,当前按钮tag:%i", __FUNCTION__,btn.tag);
    AppDelegate * dele =[UIApplication sharedApplication].delegate;
    if(dele.keyindex != btn.tag)
    {
        dele.keyindex = btn.tag;
    }
    [self ScrollToSelectedBtn:btn.tag];
}
-(void)dealloc
{
    AppDelegate * dele =[UIApplication sharedApplication].delegate;
    [dele removeObserver:self forKeyPath:@"keyindex"];
}
@end
