//
//  BanTangCollectionCell.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "BanTangCollectionCell.h"
#import "BanTangOverController.h"

@implementation BanTangCollectionCell

- (void)setBtOVc:(BanTangOverController *)btOVc {

    _btOVc = btOVc;
    
    
    btOVc.view.frame = self.bounds;
    [self.contentView addSubview:btOVc.view];
}


@end
