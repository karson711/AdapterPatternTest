//
//  ShortRentListCell.h
//  YuePoetryBridge
//
//  Created by kunge on 2018/6/21.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortRentListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *rentImage;
@property (strong, nonatomic) IBOutlet UILabel *houseName;
@property (strong, nonatomic) IBOutlet UILabel *desLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;

@end
