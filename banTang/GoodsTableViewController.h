//
//  GoodsTableViewController.h
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsTableViewController : UITableViewController

@property (nonatomic, copy) void (^tableViewStartScroll)(CGFloat offsetY);

@end
