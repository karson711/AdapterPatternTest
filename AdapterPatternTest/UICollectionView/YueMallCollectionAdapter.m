//
//  YueMallCollectionAdapter.m
//  YuePoetryBridge
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "YueMallCollectionAdapter.h"
#import "MallListCollectionCell.h"

@implementation YueMallCollectionAdapter

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MallListCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MallListCollectionCell" forIndexPath:indexPath];
    if (self.dataArray.count > 0) {
        
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){(ZJScreenWidth-LeftMargin*2)/2-5,250};
}

@end
