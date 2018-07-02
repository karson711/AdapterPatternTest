//
//  MBProgressHUD+Pzs.m
//  UnclePeng
//
//  Created by UnclePeng on 15/10/9.
//  Copyright © 2015年 pzs901. All rights reserved.
//

#import "MBProgressHUD+Pzs.h"

static NSTimeInterval _delay = 2;
static MBProgressHUD *_hud;

@implementation MBProgressHUD (Pzs)

+ (void)showWithText:(NSString *)text icon:(UIImage *)icon onView:(UIView *)view delay:(NSTimeInterval)delay{
    
    //
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:window animated:YES];
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
        if (_hud) {
            [_hud hide:YES];
        }
    }
    [MBProgressHUD dismiss];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.frame = view.bounds;
    hud.detailsLabelText = text;
    if (!icon) {
        hud.mode = MBProgressHUDModeText;
//        hud.labelText = text;
        hud.detailsLabelText = text;
    }
    else {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:icon];
    }
    if (!text) {
        hud.customView = [[UIImageView alloc] initWithImage:icon];
    }
    else {
        hud.detailsLabelText = text;
    }
    if (!text && !icon) {
        hud.mode = MBProgressHUDModeIndeterminate;
        _hud = hud;
    }
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    if (delay > 0) {
        [hud hide:YES afterDelay:delay];
    }
}

+ (void)showWithText:(NSString *)text icon:(UIImage *)icon onView:(UIView *)view delay:(NSTimeInterval)delay offset:(CGFloat)offsetY{
    
    //
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:window animated:YES];
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
        if (_hud) {
            [_hud hide:YES];
        }
    }
    [MBProgressHUD dismiss];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.frame = view.bounds;
    hud.detailsLabelText = text;
    hud.yOffset = offsetY;
    if (!icon) {
        hud.mode = MBProgressHUDModeText;
        //        hud.labelText = text;
        hud.detailsLabelText = text;
    }
    else {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:icon];
    }
    if (!text) {
        hud.customView = [[UIImageView alloc] initWithImage:icon];
    }
    else {
        hud.detailsLabelText = text;
    }
    if (!text && !icon) {
        hud.mode = MBProgressHUDModeIndeterminate;
        _hud = hud;
    }
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    if (delay > 0) {
        [hud hide:YES afterDelay:delay];
    }
}

+(void)showErrorWithMessage:(NSString *)msg onView:(UIView *)view delay:(NSTimeInterval)delay{
    [self showWithText:msg icon:[UIImage imageNamed:@"mberror"] onView:view delay:delay];
}

+(void)showErrorWithMessage:(NSString *)msg onView:(UIView *)view{
//    [self showWithText:msg icon:[UIImage imageNamed:@"mberror"] onView:view delay:_delay];
    [self showErrorWithMessage:msg onView:view delay:_delay];
}
+(void)showErrorWithMessage:(NSString *)msg {
    [self showErrorWithMessage:msg onView:nil];
}

+(void)showSuccessWithMessage:(NSString *)msg onView:(UIView *)view delay:(NSTimeInterval)delay{
    [self showWithText:msg icon:[UIImage imageNamed:@"mb37x-Checkmark"] onView:view delay:delay];
}
+(void)showSuccessWithMessage:(NSString *)msg onView:(UIView *)view{
//    [self showWithText:msg icon:[UIImage imageNamed:@"mb37x-Checkmark"] onView:view delay:_delay];
    [self showSuccessWithMessage:msg onView:view delay:_delay];
}
+(void)showSuccessWithMessage:(NSString *)msg {
    [self showSuccessWithMessage:msg onView:nil];
}

+(void)showWithMessage:(NSString *)msg onView:(UIView *)view {
    [self showWithText:msg icon:nil onView:view delay:_delay];
}
+(void)showWithMessage:(NSString *)msg {
    [self showWithMessage:msg onView:nil];
}

+(void)showChrysanthemumOnView:(UIView *)view{
    [self showWithText:nil icon:nil onView:view delay:0];
}
+(void)showChrysanthemum {
    
    [self showChrysanthemumOnView:nil];
}

+(void)showChrysanthemumWithOffsetY:(CGFloat)offsetY onView:(UIView *)view{
    
    [self showWithText:nil icon:nil onView:view delay:0 offset:offsetY];

}

+(void)dismiss {
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    [self dismissFromView:view];
}

+(void)dismissFromView:(UIView *)superView {
//    dispatch_async(dispatch_get_main_queue(), ^{
        [_hud hide:YES];
        _hud = nil;
        [MBProgressHUD hideHUDForView:superView animated:YES];
//    });
}
@end
