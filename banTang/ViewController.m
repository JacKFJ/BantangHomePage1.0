//
//  ViewController.m
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "ViewController.h"
#import "BannerViewController.h"
#import "BannerFlowLayout.h"
#import "GoodsTableViewController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) BannerViewController *bannerVc;

@property (nonatomic,strong) GoodsTableViewController *goodsVc;

@property (nonatomic,assign) CGFloat offsetY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    
    [self setupCollectionView];
    
    
   // [self setupBannerView];
}

- (void)setupBannerView {

    
    NSLog(@"%s", __FUNCTION__);
    BannerViewController *bannerVc = [[BannerViewController alloc] init];
    self.bannerVc = bannerVc;
    [self addChildViewController:bannerVc];
    bannerVc.view.frame = CGRectMake(0, 0, ScreenW, 1/3.0 * ScreenH);
    [self.view addSubview: bannerVc.view];

}


- (void)setupCollectionView {

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[BannerFlowLayout alloc] init]];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"goods"];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.view addSubview:collectionView];



}

#pragma mark -  methods of UICollectionViewDataSource 

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {



    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goods" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    GoodsTableViewController *goodsTableVc = [[GoodsTableViewController alloc] init];
    
    __weak typeof(goodsTableVc) weakGoodsTableVc = goodsTableVc;
    goodsTableVc.tableViewStartScroll = ^(CGFloat offsetY) {
        self.offsetY = offsetY;
        
    //      self.goodsVc.tableView.contentOffset = CGPointMake(0, self.offsetY);
        

        
        if (offsetY >= 114.0) {
            
            
            if (![self.view.subviews containsObject:self.bannerVc.view]) {
                
                
                NSLog(@"YYYYYYYYYYYYYYYYY");
                [self.bannerVc removeFromParentViewController];
                [self.bannerVc.view removeFromSuperview];
                
                CGRect frame = self.bannerVc.view.frame;
                
                frame.origin.y  = - (1/3.0 * ScreenH - 64- self.bannerVc.view.bounds.size.height * 1/5.0) ;
                
                self.bannerVc.view.frame = frame;
                
                [self addChildViewController:self.bannerVc];
                [self.view addSubview:self.bannerVc.view];

            }
            
        }
        
        else if (![weakGoodsTableVc.tableView.tableHeaderView.subviews containsObject:self.bannerVc.view]) {
            NSLog(@"xxxxxxxxxxxxx");
            
            [self.bannerVc removeFromParentViewController];
            [self.bannerVc.view removeFromSuperview];
            self.bannerVc.view.frame = CGRectMake(0, 0, ScreenW, 1/3.0 * ScreenH);
            [weakGoodsTableVc addChildViewController:self.bannerVc];
            [weakGoodsTableVc.tableView.tableHeaderView addSubview: self.bannerVc.view];
            
        
        }

    };
    

    self.goodsVc.tableView.contentOffset = CGPointMake(0, self.offsetY);
    self.goodsVc = goodsTableVc;
    [self addChildViewController:goodsTableVc];
    goodsTableVc.view.frame = cell.bounds;
    
    

    

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BannerViewController *bannerVc = [[BannerViewController alloc] init];
        self.bannerVc = bannerVc;
        [goodsTableVc addChildViewController:bannerVc];
        bannerVc.view.frame = CGRectMake(0, 0, ScreenW, 1/3.0 * ScreenH);
        [goodsTableVc.tableView.tableHeaderView addSubview: bannerVc.view];
    });
    
    
    [cell.contentView addSubview:goodsTableVc.view];
    
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {


    NSLog(@"%s", __FUNCTION__);
    
    self.goodsVc.tableView.contentOffset = CGPointMake(0, self.offsetY);
    
    if ([self.view.subviews containsObject:self.bannerVc.view]) return;
    
    [self.bannerVc removeFromParentViewController];
    [self.bannerVc.view removeFromSuperview];
    
    CGRect frame = self.bannerVc.view.frame;
    
    frame.origin.y -= self.offsetY;
    
    self.bannerVc.view.frame = frame;
    
    [self addChildViewController:self.bannerVc];
    [self.view addSubview:self.bannerVc.view];
    

}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    NSLog(@"%s", __FUNCTION__);
    
    self.goodsVc.tableView.contentOffset = CGPointMake(0, self.offsetY);
    
    if ([self.view.subviews containsObject:self.bannerVc.view]) return;
    
    

    [self.bannerVc removeFromParentViewController];
    [self.bannerVc.view removeFromSuperview];
    
    CGRect frame = self.bannerVc.view.frame;
    
    frame.origin.y -= self.offsetY;
    
    self.bannerVc.view.frame = frame;
    
    [self addChildViewController:self.bannerVc];
    [self.view addSubview:self.bannerVc.view];
    

}




@end
