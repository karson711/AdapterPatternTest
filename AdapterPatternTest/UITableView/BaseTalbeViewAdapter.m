//
//  BaseTalbeViewAdapter.m
//  YuePoetryBridge
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "BaseTalbeViewAdapter.h"

@interface BaseTalbeViewAdapter()

@end

@implementation BaseTalbeViewAdapter

-(instancetype)init{
    self = [super init];
    if (self) {
        _dataArray = [NSMutableArray array];
        
    }
    return self;
}

#pragma mark - Setter & Getter
-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
}

#pragma mark - 默认实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor clearColor];
    return headView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *fooView = [[UIView alloc] init];
    fooView.backgroundColor = [UIColor clearColor];
    return fooView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * showUserInfoCellIdentifier = @"baseTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.cellClickBlock) {
        self.cellClickBlock(indexPath);
    }
}


@end
