//
//  HArrowModel.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HCellModel.h"
/**
 *  用于设计传递的内容
 *
 *  @param assistView 赋值视图
 *
 *  @return 向下传递的内容
 */
typedef id(^transitiveBlock)(UIView *assistView);
/**
 *  在返回上级界面之后调用
 *
 *  @param value      修改之后的内容
 *  @param assistView 赋值视图
 */
typedef void(^newValue)(id value,UIView *assistView);


@interface HArrowModel : HCellModel

@property(nonatomic,strong)Class clazz;
/**
 *  针对向下传值 向下传递辅助Label的文字
 *
 *  @param propertyName 下一界面的属性名
 */
-(void)setTransferCurrentLabelValueForInfo:(NSString *)propertyName;
/**
 *  向下传递值 只能传递一个值 高度自定义传递方式
 *
 *  @param propertyName 接受值的属性名
 *  @param block        block返回 向下传递的值 (在跳转之前调用)
 *  @param complement   返回上级界面调用（用于给界面赋值）
 */
-(void)setTransferCurrentLabelValuePropertyName:(NSString *)propertyName value:(transitiveBlock)block newValue:(newValue)complement;

 /**标题 图片 点击函数 目标*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target;

 /**标题 图片 点击函数 目标 辅助视图*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target assistV:(HAssistType)type;


 /**标题 图片 点击函数 目标 自定义辅助视图*/
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target assistView:(UIView *(^)())assistV;
@end
