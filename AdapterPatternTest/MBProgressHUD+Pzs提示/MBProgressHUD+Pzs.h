//
//  MBProgressHUD+Pzs.h
//  UnclePeng
//
//  Created by UnclePeng on 15/10/9.
//  Copyright © 2015年 pzs901. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Pzs)

///显示错误信息 显示多久
+(void)showErrorWithMessage:(NSString *)msg onView:(UIView *)view delay:(NSTimeInterval)delay;

///显示成功信息 显示多久
+(void)showSuccessWithMessage:(NSString *)msg onView:(UIView *)view delay:(NSTimeInterval)delay;

///显示错误信息
+(void)showErrorWithMessage:(NSString *)msg onView:(UIView *)view;
+(void)showErrorWithMessage:(NSString *)msg;

///显示成功信息
+(void)showSuccessWithMessage:(NSString *)msg onView:(UIView *)view;
+(void)showSuccessWithMessage:(NSString *)msg;

///只显示文字
+(void)showWithMessage:(NSString *)msg onView:(UIView *)view;
+(void)showWithMessage:(NSString *)msg;

///显示菊花
+(void)showChrysanthemumOnView:(UIView *)view;
+(void)showChrysanthemum;
+(void)showChrysanthemumWithOffsetY:(CGFloat)offsetY onView:(UIView *)view;//可以设置Y偏移量的MB

///隐藏
+(void)dismiss;

@end
