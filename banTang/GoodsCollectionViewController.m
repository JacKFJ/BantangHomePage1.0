//
//  BanTangViewController.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "GoodsCollectionViewController.h"
#import "BanTangCollectionCell.h"
#import "BanTangOverController.h"
#import "AppDelegate.h"

@interface GoodsCollectionViewController ()

@end

@implementation GoodsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (instancetype)init {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(375, 667);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return  [super initWithCollectionViewLayout:layout];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.pagingEnabled = YES;
    
    [self.collectionView registerClass:[BanTangCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    AppDelegate * dele =[UIApplication sharedApplication].delegate;
    [dele addObserver:self forKeyPath:@"keyindex" options: NSKeyValueObservingOptionNew context:@"产生新值了"];
    self.collectionView.showsHorizontalScrollIndicator =NO;
    self.collectionView.bounces = NO;
    
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSString * str = (__bridge NSString *)context;
    if ([str isEqualToString:@"产生新值了"] )
    {
        NSString * idxstr = change[@"new"];
        NSInteger idx = idxstr.integerValue;
        CGPoint pt = CGPointMake(idx*self.collectionView.bounds.size.width, 0);
        [self.collectionView setContentOffset:pt animated:NO];
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BanTangCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    BanTangOverController *btOVc = [[BanTangOverController alloc] init];
    
    cell.btOVc = btOVc;
    
    
    //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger idx = (NSInteger)scrollView.contentOffset.x/self.collectionView.bounds.size.width;
    AppDelegate * dele =[UIApplication sharedApplication].delegate;
    if(dele.keyindex !=idx)
        dele.keyindex =idx;
    //    NSLog(@"collection.idx:%i",idx);
}
@end
