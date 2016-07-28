//
//  XYBannerView.m
//  banTang
//
//  Created by ww on 16/6/22.
//  Copyright © 2016年 ww. All rights reserved.
//

#import "XYBannerView.h"
#import "BannerViewController.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface XYBannerView ()

@property (nonatomic,strong) BannerViewController *bannerVc;

@end
@implementation XYBannerView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupChildView];
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupChildView];

        
    }
    
    return self;
}


- (void)setupChildView {


    BannerViewController *bannerVc = [[BannerViewController alloc] init];
    self.bannerVc = bannerVc;
 //   bannerVc.view.frame = CGRectMake(0, 0, ScreenW, 250);
    [self.contentView addSubview:bannerVc.view];
    
    
}

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView {

    XYBannerView *bannerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"banner"];
    
    if (bannerView == nil) {
        
        bannerView = [[XYBannerView alloc] initWithReuseIdentifier:@"banner"];
        
    }
    
    
    return bannerView;



}


- (void)layoutSubviews {

    [super layoutSubviews];
    
    
    self.bannerVc.view.frame = self.bounds;


}




@end
