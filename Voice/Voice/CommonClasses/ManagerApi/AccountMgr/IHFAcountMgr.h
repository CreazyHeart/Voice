//
//  IHFAcountMgr.h
//  IHFnurse
//
//  Created by ihefelocal001 on 16/3/5.
//  Copyright © 2016年 zhanghongwei. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络调用
#import "VIENetWork.h"

//登陆
#import "IHFLoginRequest.h"
#import "IHFAcountRespond.h"



@interface IHFAcountMgr : NSObject

//用户信息， 包含token
@property (nonatomic,strong) IHFAcountRespond *account;


+ (IHFAcountMgr*)sharedInstance;

//临时获取token接口
- (void)tmpToken:(IHFLoginRequest*)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

//登陆
- (void)login:(IHFLoginRequest*)request success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


#pragma mark - 
//保存用户数据到本地
-(void)saveLocalUserInfo:(IHFAcountRespond*)account;


#pragma mark -
//保存登录时间
- (void)saveLoginTime;

//获取登录时间
- (NSDate*)loginTime;

//删除登录的时间
- (void)deletLoginTime;


#pragma mark -
//记录 选择 的主页面
- (void)saveSelectedMainView:(NSString*)index;

//获取 选择 的主页面
- (NSString*)selectedMainView;



@end
















