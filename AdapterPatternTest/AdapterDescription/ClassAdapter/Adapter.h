//
//  Adapter.h
//  AdapterPatternTest
//
//  Created by kunge on 2018/7/2.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "Adaptee.h"
#import "Target.h"

//类适配器
//适配器：Adapter
//特点一：实现协议(目标接口)
//特点二：适配器继承被适配者
@interface Adapter : Adaptee<Target>


@end
