//
//  SPScrollVwModel.h
//  SPCollectionViewModel
//
//  Created by mac on 6/20/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPRedViewModel;

@interface SPScrollVwModel : UIScrollView

@property (nonatomic, strong) NSArray<NSString * > * titles;
//是否变色
@property (nonatomic, assign) BOOL changeColor;
//是否改变字体
@property (nonatomic, assign) BOOL changeFont;
//初始字体的样子
@property (nonatomic, assign) NSInteger fontSize;
//字体变化范围,如18-14,变化范围为4,如果changeFont为NO,则该值无效
@property (nonatomic, assign) NSInteger scaleSize;

@property (nonatomic, weak) SPRedViewModel *redView;


+(instancetype) scrollVwModelWithTitle:(NSArray<NSString * > * )titles changeColor:(BOOL)changeColor changeFont:(BOOL) changeFont fontSize: (NSInteger)fontSize scaleSize:(NSInteger) scaleSize;
//selected = 0,1,2.....
-(void) ScrollToSelectedBtn: (NSInteger) selected;

@end
