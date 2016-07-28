//
//  UIView+NJ.h
//  9期微博
//
//  Created by teacher on 14-9-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NJ)


//#warning 注意, 如果在分类中使用@property, 只会生成get/set方法的声明, 不会生成实现以及添加下划线开头的属性
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@end
