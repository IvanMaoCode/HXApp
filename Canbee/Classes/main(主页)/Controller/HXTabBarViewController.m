//
//  HXTabBarViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/2.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "HXTabBarViewController.h"
#import "personCenterViewController.h"
#import "nightViewController.h"
#import "HXTabBar.h"
@interface HXTabBarViewController ()

@end

@implementation HXTabBarViewController


//只会调用一次
+(void)load{
	//UITabBarItem *item = [UITabBarItem appearance];
	
	UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
	//创建一个描述文本属性的字典
	NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
	attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
	attrs[NSFontAttributeName] = [UIFont  systemFontOfSize:30];
	[item setTitleTextAttributes:attrs forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self setupAllTabBar];
	
	[self setupAllChildViewController];
	
	//自定义TabBar
	[self setupTabBbar];
}
-(void)setupTabBbar{
	HXTabBar *tabBar = [[HXTabBar alloc] init];
	[self setValue:tabBar forKey:@"tabBar"];
}
-(void)setupAllTabBar{
	//个人中心
	personCenterViewController *personCenterVc = [[personCenterViewController alloc] init];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:personCenterVc];
	[self addChildViewController:nav];
	
	//深夜福利
	nightViewController *nightVC = [[nightViewController alloc] init];
	UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:nightVC];
	[self addChildViewController:nav1];
}
-(void)setupAllChildViewController{
	UINavigationController *nav = self.childViewControllers[0];
	nav.tabBarItem.title = @"个人中心";
	nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6);
//图片位置
	//Vc.tabBarItem.imageInsets = UIEdgeInsetsMake(2,2,2,2)

	UINavigationController *nav1 = self.childViewControllers[1];
	nav1.tabBarItem.title = @"深夜福利";
	nav1.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6);
//	[nav1.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
}

@end
