//
//  IHFObtainHistroySearchListRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkRequest.h"

@interface IHFObtainHistroySearchListRequest : VIENetWorkRequest
@property (assign, nonatomic) NSInteger page;
@property (assign, nonatomic) NSInteger pageSize;
@property (strong, nonatomic) NSDictionary *params;



@end
