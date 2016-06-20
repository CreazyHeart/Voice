//
//  IHFRuleSearchMgr.m
//  IHFmedicine
//
//  Created by ihefe on 16/5/13.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "IHFRuleSearchMgr.h"
#import "MBProgressHUD+MJ.h"
#import "IHFGetCharacterValueRespond.h"
#import "IHFObtainHistorySearchListRespond.h"

@implementation IHFRuleSearchMgr

+ (instancetype)sharedInstance {
    
    static IHFRuleSearchMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IHFRuleSearchMgr alloc] init];
    });
    return instance;
    
}

- (void)ruleSearch:(VIENetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        if ([respond isKindOfClass:[NSDictionary class]]) {
           VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:respond];
            if (message.status == 200) {
                [MBProgressHUD showError:@"请精确搜索"];
                if (success) {
                    
                    NSMutableArray *arr = [NSMutableArray array];
                    success(arr);
                }
            }
        } else {
        
            if (success) {
                
                NSMutableArray *arr = [IHFGetCharacterValueRespond mj_objectArrayWithKeyValuesArray:respond];
                success(arr);
            }
        }
        
    } failure:failure];
    
    
}

- (void)saveSearchList:(VIENetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure{
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:respond];
        if (success) {
            success(message);
        }
        
    } failure:failure];
}


- (void)obtainHistorySearchList:(IHFObtainHistroySearchListRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {

    
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {

        NSMutableArray *array = [IHFObtainHistorySearchListRespond mj_objectArrayWithKeyValuesArray:respond];
        if (array) {
            if (success) {
                success(array);
            }
        }
        
        
        
    }
    failure:failure];

}


-(void)clearAllHistorySearchList:(VIENetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {

    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        
        VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:respond];
            if (success) {
                success(message);
            }

        
    } failure:
     
     failure];

}


- (void)deletOneSearchList:(VIENetWorkRequest *)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    //过滤掉的参数
#if 0
    NSArray *ignoreds = [NSArray arrayWithObjects:@"requestWebApi",@"requestType",@"phoneType",@"isLoading",nil];
    NSDictionary *dicParams = [request mj_keyValuesWithIgnoredKeys:ignoreds];
#else
    NSDictionary *dicParams = [request dicParamsIgnoredKeys];
#endif
    
    [VIENetWork requestAsynchronous:request requestParam:dicParams url:nil success:^(id respond) {
        VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:respond];
        if (success) {
            success(message);
        }
        
    } failure:failure];

}



@end
