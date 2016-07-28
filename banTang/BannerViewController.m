//
//  BannerViewController.m
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "BannerViewController.h"
#import "BannerFlowLayout.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface BannerViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) UICollectionView *bannerView;
@property (nonatomic,weak) UIScrollView *channelView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[self setupBannerView];
    
    [self setupChannelView];

}


//轮播View
- (void)setupBannerView {

    UICollectionView *bannerView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, self.view.bounds.size.height * 4/5.0 ) collectionViewLayout:[[BannerFlowLayout alloc] init]];
    self.bannerView = bannerView;
    [bannerView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"test"];
    [self.view addSubview:bannerView];
    bannerView.dataSource = self;
    bannerView.delegate = self;


}

//channelView
- (void)setupChannelView {

    UIScrollView *channelView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    channelView.showsHorizontalScrollIndicator = NO;
    channelView.backgroundColor = [UIColor blueColor];
    
    self.channelView = channelView;
    [self.view addSubview:channelView];
    
    CGFloat channelW = 100;
    CGFloat channelH = channelView.bounds.size.height;
    CGFloat channelY = 0;
    for (int i = 0; i < 20; ++i) {
        UILabel *channelLabel = [[UILabel alloc] init];
        channelLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat channelX = i * channelW;
        channelLabel.text = [NSString stringWithFormat:@"按钮%d",i];
        channelLabel.frame = CGRectMake(channelX, channelY, channelW, channelH);
        [channelView addSubview:channelLabel];
        
    }
    
    channelView.contentSize = CGSizeMake(channelW * 20, 0);
    
}


#pragma mark -  methods of UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    
   cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    return cell;

}


@end
