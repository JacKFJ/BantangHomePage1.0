//
//  BanTangOverController.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "BanTangOverController.h"
#import "BangTangOverCell.h"
#import "AppDelegate.h"

@interface BanTangOverController ()
@property (nonatomic, assign) CGFloat SPOffsetY;
@end

@implementation BanTangOverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.SPOffsetY = app.keyOffsetY;
    
    
    self.tableView.rowHeight = 200;
    [self.tableView registerClass:[BangTangOverCell class] forCellReuseIdentifier:@"over"];
    self.tableView.decelerationRate =UIScrollViewDecelerationRateNormal;//惯性速度设置
    //    self.tableView.pagingEnabled  =YES;//可以关闭惯性
    self.tableView.bounces = YES;//有弹簧效果,偏移可以为负数
    
}

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//
//    NSLog(@"顶层%f",scrollView.contentOffset.y);
//    
//    if (scrollView.contentOffset.y <= 0) {
//        self.tableView.scrollEnabled = NO;
//        NSLog(@"%s,%@", __FUNCTION__,self.tableView.scrollEnabled?@"YES":@"NO");
//        
//        
//    }
//
//    
//
//}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%s,顶层%f", __FUNCTION__,scrollView.contentOffset.y);
    //方向怎么判断呢?
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    CGFloat yy = app.keyOffsetY;
    if(yy <136)
    {
        yy = yy + scrollView.contentOffset.y;
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    else if(scrollView.contentOffset.y<0)
    {
        if(yy>-64)
            yy = yy + scrollView.contentOffset.y;

        scrollView.contentOffset = CGPointMake(0, 0);
        
    }
    if(yy<-64)
        yy =-64;
    if(yy>136)
        yy =136;
    app.keyOffsetY =yy;
    
    //    if (scrollView.contentOffset.y <= 0) {
    //        self.tableView.scrollEnabled = NO;
    //        NSLog(@"%s,%@", __FUNCTION__,self.tableView.scrollEnabled?@"YES":@"NO");
    //        
    //
    //    }
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //decelerate 这个值可以为0,判断标准是拖动速度
    NSLog(@"%s,decelerate:%i", __FUNCTION__,decelerate);
    //    decelerate =NO;
    //    if (scrollView.contentOffset.y <= 0) {
    //        self.tableView.scrollEnabled = NO;
    //        NSLog(@"%s,%@", __FUNCTION__,self.tableView.scrollEnabled?@"YES":@"NO");
    //        
    //        
    //    }
    
    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%s", __FUNCTION__);
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __FUNCTION__);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BangTangOverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"over" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"半糖";
    cell.textLabel.font = [UIFont systemFontOfSize:40];
    
    return cell;
}



//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//
//       self.tableView.userInteractionEnabled = YES;
//    return indexPath;
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"%@",[NSString stringWithFormat:@"点击了%zd",indexPath.row]);
    
    
}











@end
