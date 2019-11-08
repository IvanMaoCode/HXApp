//
//  personCenterViewController.m
//  Canbee
//
//  Created by Kluth on 2019/10/31.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "personCenterViewController.h"
#import "superLinkViewController.h"
#import "HXnavigationController.h"
@interface personCenterViewController ()
@property (weak, nonatomic) IBOutlet UIView *adminView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *adminImage;
@property (weak, nonatomic) IBOutlet UIButton *openlinkBtn;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@end

@implementation personCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.topView.backgroundColor = [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1.0];
	self.adminView.backgroundColor = [UIColor colorWithRed:45/255.0 green:62/255.0 blue:80/255.0 alpha:1.0];
	
	self.adminImage.layer.cornerRadius = 37.5;
	self.adminImage.clipsToBounds = YES;//When YES, content and subviews are clipped to the bounds of the view. Default is NO.
	
	[self.openlinkBtn addTarget:self action:@selector(openlink) forControlEvents:UIControlEventTouchUpInside];
	
	
	personCenterViewController *personCentVc = [[personCenterViewController alloc] init];
//	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:personCentVc];
//	[self addChildViewController:nav];
	
	//导航控制器
	UINavigationController *nav = [[UINavigationController alloc]init];
	//	[nav pushViewController:mainView animated:YES];
	
		[nav pushViewController:self animated:YES];
	
	//设置导航条给超级线路
//	[self setupNavBar];
	
}
//设置导航条
-(void)setupNavBar{

	superLinkViewController *superLinkVc = [[superLinkViewController alloc] init];
	HXnavigationController *nav = [[HXnavigationController alloc]initWithRootViewController:superLinkVc];
	[self addChildViewController:nav];
	
//	 UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//	 [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
//	 [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateHighlighted];
//	 [btn sizeToFit];
//	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
	
//	 [btn addTarget:self action:@selector(game) forControlEvents:UIControlEventTouchUpInside];
//	 //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//	 UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
//	 [containView addSubview:btn];
//	 UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
//	 self.navigationItem.leftBarButtonItem = leftItem;
	
	
//	//左边按钮 方法2
//	self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back.png"] hightImage:[UIImage imageNamed:@"back.png"]  target:self action:@selector(game)];
//
//	//右边按钮
//	self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back.png"] hightImage:[UIImage imageNamed:@"back.png"]  target:self action:@selector(share)];
//	//中间标题
//	UIImage *image = [UIImage imageNamed:@"titleView"];
//	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
}
- (IBAction)openSuperLinkBtn:(UIButton *)sender {
	
}
//开通超级线路按钮
- (IBAction)openSuperlink:(id)sender {
	superLinkViewController *superLinkVc = [[superLinkViewController alloc] init];

	[self presentViewController:superLinkVc animated:YES completion:^{
		NSLog(@"点击了个人中心");
	}];
	
	
//	superLinkViewController *superLinkVc = [[superLinkViewController alloc] init];
//
//	[self.view addSubview:superLinkVc.view];
//	[self addChildViewController:superLinkVc];
//
//	[self.navigationController pushViewController:superLinkVc animated:YES];
	
}
-(void)openlink{
	
	NSLog(@"开通按钮点击");
	
	
	
}
- (IBAction)backBtn:(id)sender {
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"关闭当前窗口完成");
	}];
//	[self popViewControllerAnimated:YES];
}
@end
