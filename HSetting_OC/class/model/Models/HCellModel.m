//
//  HCellModel.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HCellModel.h"

@interface HCellModel()

@end
@implementation HCellModel
-(instancetype)init{
    if (self = [super init]) {
        self.height =  cellHeight;
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func{
    if(self = [super init]){
        self.height =  cellHeight;
        self.title = title;
        self.imageName = name;
        self.function = func;
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name{
    return [self initWithTitle:title imageName:name func:nil];
}
-(void)setCurrentType:(HAssistType)currentType{
    _currentType = currentType;
    switch (currentType) {
        case HLableType:{
            UILabel *temp = [[UILabel alloc]init];
            temp.textAlignment = NSTextAlignmentRight;
            temp.font =  assistViewFont;
            self.assistView =temp;
        }
            break;
        case HSwitchType:{
            self.assistView  =[[UISwitch alloc]init];
        }
            break;
        case HCustomType:
            break;
       case HNoAssistView:
            self.assistView = nil;
    }
}
-(void)setHeight:(CGFloat)height{
    _height = height;
    if (self.assistView.frame.size.height<=0) {
        self.assistView.frame = CGRectMake(0, 0, assistViewMaxWidth, height);
    }
}

-(instancetype)setAssistViewAttribute:(addAttributeAction)addActionFunc{
    objc_setAssociatedObject(self, @"attribute", addActionFunc, OBJC_ASSOCIATION_COPY);
    return self;
}
-(instancetype)setSwitchInitStatus:(BOOL)status{
    if ([self.assistView isKindOfClass:[UISwitch class]]) {
        UISwitch *one = (UISwitch *)self.assistView;
        [one setOn:status animated:YES];
    }
    return self;
}
-(instancetype)setAssistLableText:(NSString*)text{
    if([self.assistView isKindOfClass:[UILabel class]]){
        UILabel *label = (UILabel *)self.assistView;
        [label setText:text];
    }
    return self;
}
-(void)dealloc{
    objc_removeAssociatedObjects(self);
}
@end
