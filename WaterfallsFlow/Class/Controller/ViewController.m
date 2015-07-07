//
//  ViewController.m
//  WaterfallsFlow
//
//  Created by Eternity° on 15/7/7.
//  Copyright (c) 2015年 Eternity. All rights reserved.
//

#import "ViewController.h"

#import "ETCollectionViewFlowLayout.h"
#import "ETCollectionViewCell.h"
#import "shopModel.h"
#import "MJExtension.h"

static NSString *identity = @"cell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,ETWaterFlowDelegate>

@property(nonatomic,retain)UICollectionView * collectView;
@property(nonatomic,strong)NSMutableArray * shops;

@end

@implementation ViewController
- (NSMutableArray *)shops
{
    if (_shops==nil) {
        self.shops = [NSMutableArray array];
        //初始化数据
        NSArray *shopsArray = [shopModel objectArrayWithFilename:@"1.plist"];
        self.shops = [shopsArray copy];
    }
    return _shops;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    ETCollectionViewFlowLayout * layOut = [[ETCollectionViewFlowLayout alloc] init];
    layOut.degelate =self;
    
    UICollectionView * collectView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layOut];
    collectView.backgroundColor = [UIColor whiteColor];
    collectView.delegate =self;
    collectView.dataSource =self;
    [self.view addSubview:collectView];
    [collectView registerClass:[ETCollectionViewCell class] forCellWithReuseIdentifier:identity];
    self.collectView = collectView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ETCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
}
//代理方法
- (CGFloat)ETwaterFlow:(ETCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    shopModel * shop = self.shops[indexPath.item];
    return shop.h/shop.w*width;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    shopModel *shop = self.shops[indexPath.item];
    NSString *name = [NSString stringWithFormat:@"所点击价格:%@",shop.price];
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSFontAttributeName] = [UIFont systemFontOfSize:17.f];
    CGSize size = [name sizeWithAttributes:attri];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UILabel *noteLabel = [[UILabel alloc]init];
        noteLabel.bounds = CGRectMake(0, 0, size.width , size.height);
        noteLabel.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * (1-0.618));
        noteLabel.backgroundColor = [UIColor blackColor];
        noteLabel.alpha = 1;
        noteLabel.textColor = [UIColor whiteColor];
        noteLabel.textAlignment = NSTextAlignmentCenter;
        noteLabel.font = [UIFont systemFontOfSize:15.0f];
        noteLabel.text = name;
        [self.view addSubview:noteLabel];
        
        [UIView animateWithDuration:2.0 animations:^{
            noteLabel.alpha = 0;
        }completion:^(BOOL finished) {
            [noteLabel removeFromSuperview];
        }];
    });
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
