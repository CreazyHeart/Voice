//
//  VIELoginViewController.m
//  Voice
//
//  Created by 户善新 on 16/6/20.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "VIELoginViewController.h"
#import "UMSocial.h"

typedef void (^SMSGetCodeResultHandler) (NSError *error);

@interface VIELoginViewController ()

/**
 *  手机号码
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
/**
 *  当前已获取的验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *Code;


- (IBAction)login;
- (IBAction)getCode;


@end

@implementation VIELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - 第三方登录 

- (IBAction)weixinLogin:(UIButton *)sender {
    
    return;
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }
        
    });
    
}

- (IBAction)qqLogin:(UIButton *)sender {
    return;
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}

- (IBAction)weiboLogin:(UIButton *)sender {
    return;
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});

}



/*************************************************************************/


- (IBAction)getCode {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumber.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error) {
     if (!error) {
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                        message:@"获取验证码成功"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
         
         UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {}];
         
         [alert addAction:defaultAction];
         [self presentViewController:alert animated:YES completion:nil];

     } else {
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                        message:@"获取验证码失败"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
         
         UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {}];
         
         [alert addAction:defaultAction];
         [self presentViewController:alert animated:YES completion:nil];

         NSLog(@"错误信息：%@",error);
     }}];
    [self.phoneNumber resignFirstResponder];
}
- (IBAction)login {
    
    [SMSSDK commitVerificationCode:self.Code.text phoneNumber:self.phoneNumber.text zone:@"86" result:^(NSError *error) {
        if(!error) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                           message:@"验证成功"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];

        }else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                           message:@"验证失败，请重新输入"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];

            
        }
    }];
    
    [self.Code resignFirstResponder];
}
@end
