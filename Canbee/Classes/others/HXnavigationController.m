//
//  HXnavigationController.m
//  Canbee
//
//  Created by Kluth on 2019/11/2.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "HXnavigationController.h"

@interface HXnavigationController ()

@end

@implementation HXnavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//搭建基本结构 -> 设置底部条 ->设置顶部条标题字体 ->处理导航控制器业务逻辑(跳转)
+ (void)load{
	UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
	
	//设置导航条标题:=> UINavigationBar
	NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
	attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
	[navBar setTitleTextAttributes:attrs];
	
	//设置导航条背景图片
	[navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackground"] forBarMetrics:UIBarMetricsDefault];
}
@end
