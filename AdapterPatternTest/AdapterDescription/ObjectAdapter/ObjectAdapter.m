//
//  ObjectAdapter.m
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "ObjectAdapter.h"

@interface ObjectAdapter()

@property(nonatomic,strong)Adaptee *adaptee;

@end

@implementation ObjectAdapter

-(instancetype)init:(Adaptee *)adaptee{
    self = [super init];
    if (self) {
        self.adaptee = adaptee;
    }
    return self;
}

-(float)getRMB{
    return [self.adaptee getUSA] * 6.5;
}

@end
