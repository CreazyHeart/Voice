//
//  IHFSaveSearchListRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkRequest.h"

@interface IHFSaveSearchListRequest : VIENetWorkRequest
@property (copy, nonatomic) NSString *slContent;
@property (copy, nonatomic) NSString *slSearchUser;

@end
