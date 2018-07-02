//
//  ObjectAdapter.h
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Target.h"
#import "Adaptee.h"

@interface ObjectAdapter : NSObject

- (instancetype)init:(Adaptee*)adaptee;

@end
