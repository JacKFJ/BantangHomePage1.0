//
//  HomePageTableViewController.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "BannerViewController.h"
#import "XYBannerView.h"
#import "BanTangGoodsCell.h"
#import "GoodsCollectionViewController.h"
#import "AppDelegate.h"
#import "SPSectionHeaderView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface HomePageTableViewController ()

@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableView registerClass:[BanTangGoodsCell class] forCellReuseIdentifier:@"homePage"];
    
    self.tableView.rowHeight = self.view.bounds.size.height;
    
    self.tableView.sectionHeaderHeight = 40;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 200)];
    
    header.backgroundColor = [UIColor orangeColor];
    
    self.tableView.tableHeaderView = header;
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    NSLog(@"__________%f_________",self.tableView.contentOffset.y);//输出竟然是0
//    app.keyOffsetY =self.tableView.contentOffset.y;
    [app addObserver:self forKeyPath:@"keyOffsetY" options:NSKeyValueObservingOptionNew context:@"offset"];
    
//    self.tableView.bounces = NO;
    
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString * str = (__bridge NSString *) context;
    CGFloat offsetY = [change[@"new"] floatValue];
    if ([str  isEqual: @"offset"]) {
        NSLog(@"+++++%f++++++",offsetY);
        if(offsetY != self.tableView.contentOffset.y)
        self.tableView.contentOffset =CGPointMake(0, offsetY);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BanTangGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homePage" forIndexPath:indexPath];
    
    GoodsCollectionViewController *goodsVC = [[GoodsCollectionViewController alloc] init];
    
    cell.goodsVc = goodsVC;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    CGFloat offsetY = scrollView.contentOffset.y;
//    
//    NSLog(@"------%f",offsetY);
    if(scrollView.contentOffset.y<-64)
        scrollView.contentOffset =CGPointMake(0, -64);
 
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        NSLog(@"__________%f_________",self.tableView.contentOffset.y);
        app.keyOffsetY =self.tableView.contentOffset.y;
    });
        
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    // 实际设置的高度是200
    //    if (offsetY >= 136.0) {
    //        
    //        !app.startScrollFlag ? : app.startScrollFlag(YES);
    //        NSLog(@"%s,YES", __FUNCTION__);
    //        
    //       // [self.tableView resignFirstResponder];
    ////       self.tableView.scrollEnabled = NO;
    //    }
    
}



//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//

//    CGFloat offsetY = scrollView.contentOffset.y;
//    
//    NSLog(@"%f",offsetY);
//    
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    
//    if (offsetY >= 136.0) {
//        
//        !app.startScrollFlag ? : app.startScrollFlag(YES);
//        NSLog(@"%s,YES", __FUNCTION__);
//        
//        // [self.tableView resignFirstResponder];
//        //       self.tableView.scrollEnabled = NO;
//    }
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
//    XYBannerView *bannerView = [XYBannerView groupHeaderViewWithTableView:tableView];
    
    
    SPSectionHeaderView *bannerView = [SPSectionHeaderView new];

    
    return bannerView;
    
}

-(void)dealloc
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app removeObserver:self forKeyPath:@"keyOffsetY"];
}





@end
