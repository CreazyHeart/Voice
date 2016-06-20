//
//  IHFGetCharacterValueRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/6.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkRequest.h"

@interface IHFGetCharacterValueRequest : VIENetWorkRequest
/**
 *  字段
 */
@property (copy, nonatomic) NSString *field;

@end
