//
//  IHFMedicIndexRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/4/20.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFMedicIndexRespond.h"


@implementation IHFMedicIndexRespond

+(NSDictionary *)mj_objectClassInArray {
    
    return @{
             @"classes"    : [IHFMedicIndexClassRespond class],
             @"bases"      : [IHFMedicIndexBaseRespond class]
             };
}

@end
