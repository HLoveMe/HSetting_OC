//
//  HRefreshModel.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HCellModel.h"

@interface HRefreshModel : HCellModel

/**标题 图片 点击函数 目标 辅助视图*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name assistType:(HAssistType)type func:(TouchAction)func;

/**标题 图片 点击函数 目标 自定义辅助视图*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name assistView:(UIView *(^)())assistV  func:(TouchAction)func;
@end
