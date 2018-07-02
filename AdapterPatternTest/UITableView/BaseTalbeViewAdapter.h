//
//  BaseTalbeViewAdapter.h
//  YuePoetryBridge
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTalbeViewAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,copy) void (^cellClickBlock)(NSIndexPath *indexPath);

@end
