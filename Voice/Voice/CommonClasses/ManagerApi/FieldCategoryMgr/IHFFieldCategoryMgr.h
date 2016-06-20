//
//  IHFFieldCategoryMgr.h
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIENetWork.h"



//字段分类
#import "IHFCharacterCategaryListRequest.h"
#import "IHFCharacterCategaryListRespond.h"

//字段分类 的 子分类
#import "IHFGetCharacterChildValueRequest.h"


//字段分类 的值
#import "IHFGetCharacterValueRequest.h"
#import "IHFGetCharacterValueRespond.h"



@interface IHFFieldCategoryMgr : NSObject

+ (instancetype)sharedInstance;


//字段分类
- (void)characterCategaryList:(IHFCharacterCategaryListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//字段分类 的 子分类
- (void)characterChildCategaryList:(IHFGetCharacterChildValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//字段分类 的值
- (void)characterValue:(IHFGetCharacterValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


@end














