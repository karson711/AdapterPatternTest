//
//  BaseCollectionViewAdapter.h
//  YuePoetryBridge
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewAdapter : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,copy) void (^cellClickBlock)(NSIndexPath *indexPath);

@end
