//
//  HTableViewController.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCell.h"
#import "HArrowModel.h"
#import "HRefreshModel.h"
#import "HItemGroup.h"
#import "constant.h"
@interface HTableViewController : UITableViewController
@property(nonatomic,strong)NSMutableArray<HItemGroup *> *dataArray;
-(void)loadData;
@end
