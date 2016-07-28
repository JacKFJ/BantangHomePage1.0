//
//  GoodsTableViewController.m
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "GoodsTableViewController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface GoodsTableViewController ()

@property (nonatomic,strong) UIView *headerView;

@end

@implementation GoodsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"banTang"];
    
    self.tableView.rowHeight = 200;
    
    self.tableView.tableHeaderView = self.headerView;
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"banTang" forIndexPath:indexPath];

    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    return cell;
}

- (UIView *)headerView {


    if (_headerView == nil) {
        _headerView = [[UIView alloc] init];
        _headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 1/3.0 * ScreenH);
    }
    return _headerView;

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;
    
    
    !self.tableViewStartScroll ? : self.tableViewStartScroll(offsetY);
   // NSLog(@"*************%f",offsetY);


    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {


    CGFloat offsetY = scrollView.contentOffset.y;
    
    //NSLog(@"*********************%f",offsetY);
    
    !self.tableViewStartScroll ? : self.tableViewStartScroll(offsetY);
    

    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    !self.tableViewStartScroll ? : self.tableViewStartScroll(offsetY);
    


    
   // NSLog(@"---------------%f",offsetY);


}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;
    !self.tableViewStartScroll ? : self.tableViewStartScroll(offsetY);
  //  NSLog(@"+++++++++++%f",offsetY);

}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//        !self.tableViewStartScroll ? : self.tableViewStartScroll(0);
//
//}


@end
