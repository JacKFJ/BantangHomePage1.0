//
//  BanTangGoodsCell.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "BanTangGoodsCell.h"
#import "GoodsCollectionViewController.h"

@interface BanTangGoodsCell ()


@property (nonatomic,strong) GoodsCollectionViewController *banTangVc;
@end
@implementation BanTangGoodsCell



- (void)setGoodsVc:(GoodsCollectionViewController *)goodsVc {

    _goodsVc = goodsVc;
    
    [self addSubview:goodsVc.view];
    
    self.banTangVc.collectionView.frame = self.bounds;



}

@end
