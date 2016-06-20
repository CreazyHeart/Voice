//
//  IHFMedicIndexClassesRespond.m
//  IHFmedicine
//
//  Created by ihefe on 16/4/29.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFMedicIndexClassRespond.h"

@implementation IHFMedicIndexClassRespond

+ (NSDictionary *)replacedKeyFromPropertyName

{
    
    return @{@"ID" : @"id"};
    
}

+(NSDictionary *)mj_objectClassInArray {
    
    return @{@"childs":[IHFMedicIndexClassRespond class]};
}


@end
