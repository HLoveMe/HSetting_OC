//
//  HArrowModel.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HArrowModel.h"

@implementation HArrowModel
-(void)setTransferCurrentLabelValueForInfo:(NSString *)propertyName{
    objc_setAssociatedObject(self, @"transfer",propertyName,OBJC_ASSOCIATION_COPY);
}
-(void)setTransferCurrentLabelValuePropertyName:(NSString *)propertyName value:(transitiveBlock)block newValue:(newValue)complement{
     objc_setAssociatedObject(self, @"propertyName",propertyName,OBJC_ASSOCIATION_COPY);
     objc_setAssociatedObject(self, @"transitiveValue",block,OBJC_ASSOCIATION_COPY);
     objc_setAssociatedObject(self, @"complement", complement, OBJC_ASSOCIATION_COPY);
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target{
    if (self=[super initWithTitle:title imageName:name func:func]) {
        self.clazz = target;
        self.assistView =nil;
        self.currentType = HNoAssistView;
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target assistView:(UIView *(^)())assistV{
    if(self = [super initWithTitle:title imageName:name func:func]){
        self.clazz = target;
        if (assistV)
            self.assistView = assistV();
        self.currentType= HCustomType;
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func clazz:(Class)target assistV:(HAssistType)type{
    if (self=[super initWithTitle:title imageName:name func:func]) {
        self.clazz = target;
        self.currentType = type;
    }
    return self;
}
-(void)dealloc{
    objc_removeAssociatedObjects(self);
}
@end
