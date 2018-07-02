//
//  ShortRentAdapater.m
//  YuePoetryBridge
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "ShortRentAdapater.h"
#import "ShortRentListCell.h"

@implementation ShortRentAdapater

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [super numberOfSectionsInTableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShortRentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShortRentListCell"];

    return cell;
}

@end
