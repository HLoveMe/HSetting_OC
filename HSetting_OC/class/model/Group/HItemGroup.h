//
//  HItemGroup.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCellModel.h"
@interface HItemGroup : NSObject
@property(nonatomic,copy)NSString *headTitle;
@property(nonatomic,copy)NSString *footTitle;
@property(nonatomic,strong)NSMutableArray<HCellModel *> *items;

+(instancetype)group;
@end
