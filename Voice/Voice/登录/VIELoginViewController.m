//
//  VIELoginViewController.m
//  Voice
//
//  Created by 户善新 on 16/6/20.
//  Copyright © 2016年 户善新. All rights reserved.
//

#import "VIELoginViewController.h"

@interface VIELoginViewController ()

/**
 *  手机号码
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

- (IBAction)getCode;

/**
 *  当前以获取的验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *Code;//验证码
- (IBAction)login;

@end

@implementation VIELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)weixinLogin:(UIButton *)sender {
}
- (IBAction)qqLogin:(UIButton *)sender {
}

- (IBAction)weiboLogin:(UIButton *)sender {
}



/*************************************************************************/


- (IBAction)getCode {
    
    
}
- (IBAction)login {
    
    
}
@end
