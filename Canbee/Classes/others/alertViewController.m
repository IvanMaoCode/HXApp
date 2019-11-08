//
//  alertViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/3.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//
//
//  ViewController.m
//  CustomIOSAlertView
//
//  Created by Richard on 20/09/2013.
//  Copyright (c) 2013-2015 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import "alertViewController.h"

@interface alertViewController ()

@end

@implementation alertViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Just a subtle background color
	[self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
	
	// A simple button to launch the demo
	UIButton *launchDialog = [UIButton buttonWithType:UIButtonTypeCustom];
	[launchDialog setFrame:CGRectMake(10, 30, self.view.bounds.size.width-20, 50)];
	[launchDialog addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
	[launchDialog setTitle:@"Launch Dialog" forState:UIControlStateNormal];
	[launchDialog setBackgroundColor:[UIColor whiteColor]];
	[launchDialog setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[launchDialog.layer setBorderWidth:0];
	[launchDialog.layer setCornerRadius:5];
	[self.view addSubview:launchDialog];
	
	
}

- (IBAction)launchDialog:(id)sender
{
	
	Boolean *password = false;
	if(!password){
		// Here we need to pass a full frame
		CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
		
		// Add some custom content to the alert view
		[alertView setContainerView:[self createDemoView]];
		
		// Modify the parameters
		[alertView setButtonTitles:[NSMutableArray arrayWithObjects: @"取消", nil]];
		[alertView setDelegate:self];
		
		// You may use a Block, rather than a delegate.
		[alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
			NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
			[alertView close];
		}];
		
		[alertView setUseMotionEffects:true];
		
		// And launch the dialog
		[alertView show];
		
	}
}


- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
	NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
	[alertView close];
}

- (UIView *)createDemoView
{
	UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 300)];
	
	UITextField *countText = [[UITextField alloc] init];
	[countText setFrame:CGRectMake(10, 20, 270, 30)];
	[countText setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	
	UITextField *password = [[UITextField alloc] init];
	[password setFrame:CGRectMake(10,70, 270, 30)];
	[password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	
	UIButton *registerBtn = [[UIButton alloc] init];
	[registerBtn setFrame:CGRectMake(20, 130, 100, 100)];
	[registerBtn setBackgroundColor:[UIColor blueColor]];
	[registerBtn setTitle:@"注册" forState:UIControlStateNormal];
	[registerBtn setTitle:@"点击注册" forState:UIControlStateHighlighted];
	[registerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	
	UIButton *passwordBtn = [[UIButton alloc] init];
	[passwordBtn setFrame:CGRectMake(150, 130, 100, 100)];
	[passwordBtn setBackgroundColor:[UIColor blueColor]];
	[passwordBtn setTitle:@"登录" forState:UIControlStateNormal];
	[passwordBtn setTitle:@"点击登录" forState:UIControlStateHighlighted];
	[passwordBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	
	
	[demoView addSubview:countText];
	[demoView addSubview:password];
	[demoView addSubview:registerBtn];
	[demoView addSubview:passwordBtn];
	
	return demoView;
}

@end

