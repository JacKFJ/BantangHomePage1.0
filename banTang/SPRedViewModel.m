//
//  SPRedViewModel.m
//  SPCollectionViewModel
//
//  Created by mac on 6/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "SPRedViewModel.h"
#import "SPScrollVwModel.h"
#import "AppDelegate.h"
#import "UIView+NJ.h"
#import "SPScrollVwModel.h"

#define lineWith 3

@interface SPRedViewModel ()

@property (nonatomic, strong) UIView *redView;

@end

@implementation SPRedViewModel
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
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator =NO;
    self.tag =1000;
    self.isTONGBU =YES;
}
-(void)frameAnimatonWithIndex:(NSInteger) idx
{
    UIButton * selectedBtn = [self.btnView viewWithTag:idx];
    CGFloat originX = selectedBtn.x;
    CGFloat offsetX = self.btnView.contentOffset.x;
    CGFloat targetX = originX -offsetX;
    CGRect fme = selectedBtn.frame;
    self.redView.height =lineWith;
    fme.size.height = lineWith;
////    [UIView animateWithDuration:0.4 animations:^{
//        self.redView.width = fme.size.width;
////    }];
////    dispatch_async(dispatch_get_main_queue(), ^{
//    if(self.redView.x != targetX)
//        [UIView animateWithDuration:0.4 animations:^{
//            self.redView.x = originX;
//        }];
////    });
    [UIView animateWithDuration:0.8 animations:^{
        CGRect fme = selectedBtn.frame;
//        fme.size.height =lineWith;
        fme.origin.x = targetX;
        self.redView.frame  =fme;
    }];
    self.isTONGBU = YES;
}
-(void) frameAnimaton:(CGFloat) XX
{
    
    NSLog(@"%s", __FUNCTION__);
    if(self.isTONGBU)
    self.redView.x = XX;
}
-(void)setBtnView:(SPScrollVwModel *)btnView
{
    _btnView = btnView;
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    UIButton * selectedBtn = [btnView viewWithTag:0];
    self.redView.frame = selectedBtn.frame;
    [self addSubview:self.redView];
    
}

@end
