//
//  addTimeViewController.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "addTimeViewController.h"
#import "mainViewController.h"
@interface addTimeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *lockView;

@end

@implementation addTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
	//这里加判断
	Boolean *countNum = false;
	if(countNum){
		[self.lockView setImage:[UIImage imageNamed:@"已解锁"] forState:UIControlStateNormal];
	}
}
- (IBAction)backSubView:(id)sender {
	mainViewController *mainView = [[mainViewController alloc] init];
	
	[self popoverPresentationController];

	
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
