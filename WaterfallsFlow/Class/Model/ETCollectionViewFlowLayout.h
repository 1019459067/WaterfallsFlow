//
//  ETCollectionViewFlowLayout.h
//  WaterfallsFlow
//
//  Created by Eternity° on 15/7/7.
//  Copyright (c) 2015年 Eternity. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETCollectionViewFlowLayout;
@protocol ETWaterFlowDelegate <NSObject>

-(CGFloat)ETwaterFlow:(ETCollectionViewFlowLayout*)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

@end

@interface ETCollectionViewFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)CGFloat rowMagrin;
@property(nonatomic,assign)CGFloat colMagrin;
@property(nonatomic,assign)CGFloat colCount;
@property(nonatomic,weak)id<ETWaterFlowDelegate>degelate;

@end
