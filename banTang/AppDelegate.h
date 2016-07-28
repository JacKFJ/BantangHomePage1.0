//
//  AppDelegate.h
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


//@property (nonatomic, copy) void (^startScrollFlag)(BOOL);

@property (nonatomic, assign) CGFloat keyOffsetY;
@property (nonatomic, assign) NSInteger keyindex;

@end

