//
//  IHFMedicSearchInstrRequest.h
//  IHFmedicine
//
//  Created by ihefe on 16/4/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWorkRequest.h"

@interface IHFMedicSearchInstrRequest : VIENetWorkRequest

@property (strong, nonatomic) NSNumber *page;
@property (strong, nonatomic) NSNumber *pageSize;
@property (strong, nonatomic) NSDictionary *params;

@end
