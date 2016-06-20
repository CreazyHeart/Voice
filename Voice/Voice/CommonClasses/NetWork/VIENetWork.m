//
//  IHFNetWork.m
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import "VIENetWork.h"
#import "VIENetWorkMgr.h"
#import "MJExtension.h"
#import "IHFAcountRespond.h"



//存放网络 IP
NSString *ihfNetWork_IP = @"";


@implementation VIENetWork


//网络请求的基地址
+ (NSString*)hostURL
{
    NSString *url = ihfNetWork_IP;
    
    if (url && url.length>0) {
        return url;
    }

    return url;
}


//初始化网络 IP (程序一开始启动的时候就要调用)
+ (void)registerNetWorkIP:(NSString*)netWorkIP
{
    ihfNetWork_IP = netWorkIP;
}


#pragma mark - public
/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param request 网络请求参数
 * @param otherParam 网络请求的额外参数，一般情况为nil
 */
+ (void)requestAsynchronous:(VIENetWorkRequest*)request otherParam:(NSDictionary*)otherParam url:(NSString*)url success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    
    //请求参数
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:[request mj_keyValues]];

    //一些其它参数(可以不要)
    if (otherParam && otherParam.count>0) {
        [param addEntriesFromDictionary:otherParam];
    }

    [self requestAsynchronous:request requestParam:param url:url success:success failure:failure];
    
}

/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param requestStyle 网络请求方式
 * @param requestParam 网络请求参数
 */
+ (void)requestAsynchronous:(VIENetWorkRequest*)requestStyle requestParam:(NSDictionary*)requestParam url:(NSString*)url success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    //提交给服务器的参数
    //拼接 请求地址
    NSString *urlString = @"";
    if (!url || url.length==0) {
        urlString = [NSString stringWithFormat:@"%@/%@", [self hostURL], requestStyle.requestWebApi];
    }
    else {
        urlString = [NSString stringWithFormat:@"%@/%@", url, requestStyle.requestWebApi];
    }
    
    //请求方式
    NSString *method = requestStyle.requestType;
    
    //网络请求
    [self requestAsynchronous:method urlString:urlString dicParams:requestParam success:success failure:failure];

}



/*
 *
 *
 *
 *
 */
/*****************************以下为私有方法***********************************/

#pragma mark - private
/**
 * 网络请求，包含 “GET” 和 "POST" 方法
 *
 * @param method        网络请求类型：“GET”，"POST"
 * @param urlString     网络请求 URL
 * @param dicParams     网络请求的参数
 */
+ (void)requestAsynchronous:(NSString*)method urlString:(NSString*)urlString dicParams:(NSDictionary*)dicParams success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    //网络请求
    [[VIENetWorkMgr sharedInstance] requestAsynchronous:method urlString:urlString dicParams:dicParams success:^(NSInteger statusCode, NSDictionary *respond) {
        
        if (statusCode == 200 || statusCode == 201 || statusCode == 204) {
            if (success) {
                success(respond);
            }
        }
        else {
            VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:respond];
            message.status = statusCode;
            
            if (failure) {
                failure(message);
            }
        }
        
    } failure:^(NSInteger statusCode,  NSString *localizedDescription, NSString *errorStr) {
        
        VIENetWorkMsg *message = [VIENetWorkMsg mj_objectWithKeyValues:errorStr];
        message.status = statusCode;
        if (message.reasons.count>0) {
            VIENetWorkMsgReason *reason = message.reasons[0];
            if (!reason.message || reason.message.length==0) {
                reason.message = localizedDescription;
            }
        }
        
        if (failure) {
            failure(message);
        }
        
    }];
}

@end












