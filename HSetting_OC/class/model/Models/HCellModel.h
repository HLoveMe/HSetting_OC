//
//  HCellModel.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "HSwitch.h"
#import "constant.h"
typedef void(^TouchAction)(UIView *assistView);
typedef void(^addAttributeAction)(UITableViewCell *cell, UIView *view);
typedef enum {
   HLableType=1,
   HSwitchType,
   HCustomType,
   HNoAssistView
}HAssistType;
            /**请使用子类*/
@interface HCellModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)TouchAction function;
@property(nonatomic,strong)UIView *assistView;
@property(nonatomic,assign)HAssistType currentType;


 /**标题 图片 功能*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func;
 /**标题 图片 */
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name;



 /**给辅助视图增加自定义的属性 在cell显示之前调用*/
-(void)setAssistViewAttribute:(addAttributeAction)addActionFunc;

/**如果辅助视图为开关 要设置初始状态  只生效一次*/
-(void)setSwitchInitStatus:(BOOL)status;

/**给Label设置值*/
-(void)setAssistLableText:(NSString*)text;
@end