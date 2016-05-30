//
//  sourceViewcontroller.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "sourceViewcontroller.h"
#import "targetViewController.h"
@implementation sourceViewcontroller
-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData{
    HItemGroup *groupTwo = [HItemGroup group];

    HArrowModel *two1 = [[HArrowModel alloc]initWithTitle:@"文字向下传递" imageName:@"stage_5" func:nil clazz:[targetViewController class] assistV:HLableType];
    [two1 setAssistLableText:@"战争学院"];
     /**传递Label的值*/
//    [two1 setTransferCurrentLabelValueForInfo:@"currentTitle"];
    //或者
     /** 自定义向下传递的内容*/
    [two1 setTransferCurrentLabelValuePropertyName:@"button" value:^id(UIView *assistV) {
        return [[UIButton alloc]init];
    } newValue:^(id value,UIView *assisetView) {
        UIView *one = value;
        NSLog(@"%@",NSStringFromCGRect(one.frame));
    }];
    
    
    
    
     /**传递整个Model*/
    __block HArrowModel *two2 =[[HArrowModel alloc]initWithTitle:@"Model向下传递" imageName:@"stage_5" func:^(UIView *one){
        
    }  clazz:[targetViewController class]];
    
    __weak HArrowModel *this = two2;
    [two2 setTransferCurrentLabelValuePropertyName:@"arrowModel" value:^id(UIView *assistView){
        
        return this;
    } newValue:^(id value, UIView *assistView) {
        HArrowModel *model = value;
        NSLog(@"%@",model.title);
    }];
    
    
    [groupTwo.items addObject:two1];
    [groupTwo.items addObject:two2];
    [self.dataArray addObject:groupTwo];


}

@end
