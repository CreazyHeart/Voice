//
//  IHFFieldCategoryMgr.m
//  IHFmedicine
//
//  Created by ihefelocal001 on 16/5/26.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFFieldCategoryMgr.h"

@implementation IHFFieldCategoryMgr

+ (IHFFieldCategoryMgr*)sharedInstance
{
    static IHFFieldCategoryMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IHFFieldCategoryMgr alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark - 字段分类
- (void)characterCategaryList:(IHFCharacterCategaryListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [IHFCharacterCategaryListRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];
    
}


#pragma mark - 字段分类 的 子分类
- (void)characterChildCategaryList:(IHFGetCharacterChildValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [IHFGetCharacterValueRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];

}

#pragma mark - 字段分类 的值
- (void)characterValue:(IHFGetCharacterValueRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    
    //过滤掉的参数
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];

    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(NSArray *respond) {
        
        if (respond.count > 0) {
            NSMutableArray *arr = [NSMutableArray array];
            arr = [IHFGetCharacterValueRespond mj_objectArrayWithKeyValuesArray:respond];
            if (success) {
                success(arr);
            }
        }
    } failure:failure];

}

@end













