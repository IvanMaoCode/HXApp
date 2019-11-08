//
//  commonNavController.m
//  Canbee
//
//  Created by Kluth on 2019/11/1.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "commonNavController.h"

@interface commonNavController ()

@end

@implementation commonNavController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = MJSColor(20, 133, 185)
}
- (IBAction)backBBtn:(id)sender {
	[self dismissViewControllerAnimated:YES completion:^{
			NSLog(@"返回了常用导航栏");
	}];
}



@end
