//
//  VIEAppDelegateMgr.m
//  Voice
//
//  Created by 户善新 on 16/6/15.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "VIEAppDelegateMgr.h"
#import "VIENetWork.h"
// 键盘管理
#import "IQKeyboardManager.h"

#import "VIE_Macros_Web_Api.h"

#import "VIEDatabaseUpgrade.h"

#import "VIE_Macros.h"

@implementation VIEAppDelegateMgr


+ (VIEAppDelegateMgr*)sharedInstance
{
    static VIEAppDelegateMgr *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[VIEAppDelegateMgr alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)dealloc{
    
}


#pragma mark - 程序 启动时 加载数据 和 初始化
- (BOOL)loadData
{
    //设置服务器 IP地址
    [VIENetWork registerNetWorkIP:VIE_NetWork_Web_Api];
    
    //数据库初始化及升级操作
    //    if (![self checkDatabase]) {
    //        return NO;
    //    }
    
    //键盘管理
    [self IQKeyboardMgr];
    
    return YES;
}

#pragma mark - 键盘管理(一旦设置将在整个程序中起作用)
/**
 如果你想在某个 viewcontroller 禁用 IQKeyboardManager 你应该在 ViewDidAppear 中禁用IQKeyboardManager，而在ViewWillDisappear启用它
 代码：
 -(void)viewDidAppear:(BOOL)animated
 {
 [super viewDidAppear:animated];
 [[IQKeyboardManager sharedManager] setEnable:NO];
 }
 -(void)viewWillDisappear:(BOOL)animated
 {
 [super viewWillDisappear:animated];
 [[IQKeyboardManager sharedManager] setEnable:YES];
 }
 */
- (void)IQKeyboardMgr
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    //enable 控制整个功能是否启用
    manager.enable = YES;
    //shouldResignOnTouchOutside 控制点击背景是否收起键盘
    manager.shouldResignOnTouchOutside = YES;
    //shouldToolbarUsesTextFieldTintColor 控制键盘上的工具条文字颜色是否用户自定义
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    //enableAutoToolbar控制是否显示键盘上的工具条
    manager.enableAutoToolbar = NO;
    //设置键盘距离 TextField 的距离
    //manager.keyboardDistanceFromTextField = 120.f;
}


#pragma mark - 数据库初始化及升级操作
- (BOOL)checkDatabase
{
    /////////////////// Init local database ////////////////////////////////////
    VIEDatabaseUpgrade *dbConfigLogic = [[VIEDatabaseUpgrade alloc] init];
    //    dbConfigLogic.allowDowngrade = YES; //是否允许数据库降级，默认不允许。
    BOOL checkResult = [dbConfigLogic checkDatabase:LOCAL_MAIN_DB_PATH newVersion:dbConfigLogic.dbVersion];
    if (!checkResult) {
        NSLog(@"check db fail.");
        
        //        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示"
        //                                                            message:@"数据库初始化失败，不能继续加载，请彻底关闭程序后再次尝试，或者联系系统管理员。"
        //                                                           delegate:nil
        //                                                  cancelButtonTitle:@"确定"
        //                                                  otherButtonTitles:nil, nil];
        //        [alertview show];
        return NO;
    }
    else {
        NSLog(@"check db success.");
    }
    ////////////////////////// END /////////////////////////////////////////////
    
    return YES;
}


@end
