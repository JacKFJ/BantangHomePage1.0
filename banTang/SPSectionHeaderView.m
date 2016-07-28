//
//  SPSectionHeaderView.m
//  banTang
//
//  Created by mac on 6/23/16.
//  Copyright © 2016 ww. All rights reserved.
//

#import "SPSectionHeaderView.h"
#import "SPRedViewModel.h"
#import "SPScrollVwModel.h"

@interface SPSectionHeaderView ()


@end

@implementation SPSectionHeaderView

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
    CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    SPScrollVwModel * btnView = [SPScrollVwModel scrollVwModelWithTitle:self.titles changeColor:YES changeFont:YES fontSize:16 scaleSize:2];
    btnView.frame =CGRectMake(0, 0, ScreenWidth, 37);
    //    NSLog(@"%i,%i",btnView.fontSize,btnView.scaleSize);
    [self addSubview:btnView];
    
    SPRedViewModel * redView = [SPRedViewModel new];
    redView.frame = CGRectMake(0, 32, ScreenWidth, 3);
    redView.btnView = btnView;
    btnView.redView = redView;
    [self addSubview:redView];
}

-(NSArray *)titles
{
    if (_titles == nil) {
        _titles = @[
                    @"精选",@"用户原创",@"Fashion",@"折扣",@"一周最热",
                    @"美妆&穿搭",@"礼物",@"美食",@"设计感",@"文艺",
                    @"学生党",@"读书"//12个
                    ];
    }
    return _titles;
}

@end
