//
//  AppDelegate.m
//  Voice
//
//  Created by 户善新 on 16/6/20.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "AppDelegate.h"
#import "VIEAppDelegateMgr.h"
#import "VIEViewControllerMgr.h"
#import <SMS_SDK/SMSSDK.h>
#import "UMSocial.h"
#import "VIE_AppKey.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /************************************************************
     //ios7修改界面顶部状态栏内的文字颜色
     第一步：打开**-Info.plist
     点击根节点的+号新增一行：View controller-based status bar appearance，并设置为NO
     
     第二步：打开
     打开**delegate.m文件，在 application: didFinishLaunchingWithOptions 添加以下方法
     ************************************************************/
    [application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    /************************************************************/
    
    
    
    //程序 启动时 加载数据 和 初始化
    [[VIEAppDelegateMgr sharedInstance] loadData];
    
    //根试图
    self.window.rootViewController = [[VIEViewControllerMgr sharedInstance] creatRootViewControl];
    
    
    // SMS第三方短信验证初始化
    [SMSSDK registerApp:SMS_AppKey withSecret:SMS_AppSecret];

    // UMeng 第三方初始化
    [UMSocialData setAppKey:UMeng_AppKey];
    
    // 第三方QQ登录初始化
    //设置分享到QQ/Qzone的应用Id，和分享url 链接

    [UMSocialQQHandler setQQWithAppId:QQ_AppId appKey:QQ_AppKey url:@"http://www.umeng.com/social"];
    // 第三方微信登录
    //设置微信AppId、appSecret，分享url
    
    [UMSocialWechatHandler setWXAppId:WX_AppId appSecret:WX_AppSecret url:@"http://www.umeng.com/social"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
