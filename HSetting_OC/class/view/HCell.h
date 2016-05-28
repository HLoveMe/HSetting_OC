//
//  HCell.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HArrowModel.h"
#import "HRefreshModel.h"
#import "constant.h"
@interface HCell : UITableViewCell
@property(nonatomic,strong)HCellModel *model;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
