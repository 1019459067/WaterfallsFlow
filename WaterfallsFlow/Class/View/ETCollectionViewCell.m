//
//  ETCollectionViewCell.m
//  WaterfallsFlow
//
//  Created by Eternity° on 15/7/7.
//  Copyright (c) 2015年 Eternity. All rights reserved.
//

#import "ETCollectionViewCell.h"

#import "shopModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ETCollectionViewCell ()

@property (weak, nonatomic) UIImageView *shopImage;
@property (weak, nonatomic) UILabel *shopName;

@end
@implementation ETCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}
- (void)initViews {
    UIImageView *shopImage = [[UIImageView alloc]init];
    [self addSubview:shopImage];
    self.shopImage = shopImage;
    
    UILabel *shopName = [[UILabel alloc]init];
    [self addSubview:shopName];
    self.shopName = shopName;
    shopName.textAlignment = NSTextAlignmentRight;
}
- (void)setShop:(shopModel *)shop {
    _shop = shop;
    [self.shopImage sd_setImageWithURL:[NSURL URLWithString:self.shop.img]];
    self.shopName.text = self.shop.price;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.shopImage.frame = self.bounds;
    self.shopName.frame = CGRectMake(0, 0, self.frame.size.width - 10, 30);
}
@end
