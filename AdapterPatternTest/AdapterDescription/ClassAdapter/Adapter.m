//
//  Adapter.m
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "Adapter.h"

@implementation Adapter

-(float)getRMB{
    return [self getUSA] * 6.5;
}

@end
