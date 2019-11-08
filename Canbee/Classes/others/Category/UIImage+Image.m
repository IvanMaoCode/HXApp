//
//  UIImage+Image.m
//  Canbee
//
//  Created by Kluth on 2019/11/2.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+(UIImage *)imageOriginalWithName:(NSString *)imageName{
	UIImage *image = [UIImage imageNamed:imageName];
	return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
