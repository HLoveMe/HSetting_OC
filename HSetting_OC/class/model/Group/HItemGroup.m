//
//  HItemGroup.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HItemGroup.h"

@implementation HItemGroup
-(NSMutableArray *)items{
    if (nil==_items) {
        _items=[NSMutableArray array];
    }
    return _items;
}
+(instancetype)group{
    return  [[HItemGroup alloc]init];
}
@end
