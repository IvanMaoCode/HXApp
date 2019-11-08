//
//  loginRegisterViewController.m
//  Canbee
//
//  Created by Kluth on 2019/10/31.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "loginRegisterViewController.h"

@interface loginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *loginLogo;
@property (weak, nonatomic) IBOutlet UIView *idAcount;
@property (weak, nonatomic) IBOutlet UIView *password;
@property (weak, nonatomic) IBOutlet UIView *noticeView;
@property (weak, nonatomic) IBOutlet UITextField *IdAccountInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;

@end

@implementation loginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.loginLogo.layer.cornerRadius =  32.25;
	self.loginLogo.clipsToBounds = YES;
	
	self.noticeView.backgroundColor = [UIColor colorWithRed:15/255.0 green:127/255.0 blue:165/255.0 alpha:1.0];
	
	self.idAcount.layer.borderWidth =  1;
	self.idAcount.layer.cornerRadius = 24.5;
	self.idAcount.layer.borderColor = [[UIColor whiteColor] CGColor];
	self.password.layer.borderWidth = 1;
	self.password.layer.cornerRadius = 24.5;
	self.password.layer.borderColor = [[UIColor whiteColor] CGColor];
	
	self.IdAccountInput.borderStyle = UITextBorderStyleNone;
	self.passwordInput.borderStyle = UITextBorderStyleNone;
}
- (IBAction)back:(id)sender {
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"返回了");
	}];
}
/*
 UITextBorderStyleNone,
 UITextBorderStyleLine,
 UITextBorderStyleBezel,
 UITextBorderStyleRoundedRect
 */

@end
