//
//  HRefreshModel.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HRefreshModel.h"

@implementation HRefreshModel
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func  assistType:(HAssistType)type{
    if(self=[super init]){
        self.title = title;
        self.imageName = name;
        self.function = func;
        self.currentType = type;
    }
    return  self;
}
-(instancetype)initWithTitle:(NSString *)title imageName:(NSString *)name func:(TouchAction)func  assistView:(UIView *(^)())assistV{
    if (self= [super init]) {
        self.title = title;
        self.imageName =name;
        self.function = func;
        if (assistV) {
            self.assistView = assistV();
        }
    }
    return self;
}
@end
