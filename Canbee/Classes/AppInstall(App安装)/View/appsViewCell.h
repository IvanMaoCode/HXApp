//
//  appsViewCell.h
//  Canbee
//
//  Created by Kluth on 2019/11/7.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class appItem;
@interface appsViewCell : UITableViewCell
@property(nonatomic,strong) appItem *item;
@end

NS_ASSUME_NONNULL_END
