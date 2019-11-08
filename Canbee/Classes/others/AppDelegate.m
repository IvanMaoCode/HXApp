//
//  AppDelegate.m
//  Canbee
//
//  Created by Kluth on 2019/10/30.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "personCenterViewController.h"
#import "loginRegisterViewController.h"

#import "popmessageViewController2.h"
#import "commonNavController.h"
#import "superLinkViewController.h"
#import "addTimeViewController.h"
#import "testViewController.h"

#import "HXTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	personCenterViewController *personCenterView = [[personCenterViewController alloc] init];
	loginRegisterViewController *loginRegister = [[loginRegisterViewController alloc] init];
	popmessageViewController2 *popmessage2 = [[popmessageViewController2 alloc] init];
	commonNavController *commonNav = [[commonNavController alloc]  init];
	superLinkViewController *superLikeVc = [[superLinkViewController alloc] init];
	addTimeViewController *addTime = [[addTimeViewController alloc] init];
	testViewController *test = [[testViewController alloc]init];
	mainViewController *mainView = [[mainViewController alloc] init];
	
	
	//创建窗口
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	
	//设置窗口根控制器
	HXTabBarViewController *tabBarVc = [[HXTabBarViewController alloc] init];
	

	self.window.rootViewController = mainView;
//
//	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainView];
//	[tabBarVc addChildViewController:nav];
//	[nav pushViewController:mainView animated:YES];
//	[nav pushViewController:personCenterView animated:YES];
	//3.显示窗口
	[self.window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
