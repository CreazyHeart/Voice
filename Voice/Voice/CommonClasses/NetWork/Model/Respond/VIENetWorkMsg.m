//
//  IHFNetWorkMsg.m
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkMsg.h"

@implementation VIENetWorkMsg


// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"status" : @"status",
             @"reasons" : @"reasons"
             };
}

// 模型中有个数组属性，数组里面又要装着其它模型
+ (NSDictionary *)objectClassInArray{
    return @{
             @"reasons" : @"IHFNetWorkMsgReason"
             };
}


@end




















