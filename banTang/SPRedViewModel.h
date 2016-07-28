//
//  SPRedViewModel.h
//  SPCollectionViewModel
//
//  Created by mac on 6/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPScrollVwModel;
@interface SPRedViewModel : UIScrollView

@property (nonatomic, weak) SPScrollVwModel *btnView;

@property (nonatomic, assign) BOOL isTONGBU;
-(void) frameAnimaton:(CGFloat) XX;

-(void)frameAnimatonWithIndex:(NSInteger) idx;
@end
