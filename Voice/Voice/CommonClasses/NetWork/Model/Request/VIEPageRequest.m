//
//  IHFPageRequest.m
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIEPageRequest.h"

@implementation VIEPageRequest

- (id)init
{
    self = [super init];
    if (self) {
        self.pageIndex = 1;
        self.pageSize = 15;
    }
    return self;
}

@end
