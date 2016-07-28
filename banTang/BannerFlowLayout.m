//
//  BannerFlowLayout.m
//  banTang
//
//  Created by ww on 16/6/21.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "BannerFlowLayout.h"

@implementation BannerFlowLayout

- (void)prepareLayout {

    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.collectionView.pagingEnabled = YES;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
}

@end
