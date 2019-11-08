//
//  testViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/2.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor greenColor];
	[self setupNav];
}
-(void)setupNav{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.backgroundColor = [UIColor redColor];
//	[btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
//	[btn setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateHighlighted];
	[btn sizeToFit];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
	
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
