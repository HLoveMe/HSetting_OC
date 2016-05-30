//
//  setting.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "setting.h"
#import "resultViewC.h"
#import "sourceViewcontroller.h"
@implementation setting
-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
}

-(void)loadData{
    HItemGroup *groupOne = [HItemGroup group];
    /**自定义辅助视图 点击cell对辅助视图进行操作*/
    HRefreshModel *one1 = [[HRefreshModel alloc]initWithTitle:@"白金" imageName:@"stage_1"  assistView:^UIView *{
        /**这里的代码之后调用一次*/
        UIActivityIndicatorView *one= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //        [one startAnimating]; 这种操作 在复用之后就会失效
        return one;
    } func:^(UIView *assistView) {
        UIActivityIndicatorView *action = (UIActivityIndicatorView *)assistView;
        if (action.isAnimating) {
            [action stopAnimating];
        }else
            [action startAnimating];
        
    }];
    [one1 setAssistViewAttribute:^(UITableViewCell *cell, UIView *view) {
        /**每次显示之前就会调用代码块*/
        UIActivityIndicatorView *one = (UIActivityIndicatorView *)view;
        [one startAnimating];
    }];
    
    
    /**给定默认的视图 Label*/
    HRefreshModel *one2 = [[HRefreshModel alloc]initWithTitle:@"白银" imageName:@"stage_2" assistType:HLableType func:^(UIView *assistView) {
        UILabel *one =(UILabel *)assistView;
        one.text = @"梁珊";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            one.text = @"朱子豪";
        });    }];
    [one2 setAssistLableText:@"朱子豪"];
    [one2 setAssistViewAttribute:^(UITableViewCell *cell, UIView *view) {
        view.backgroundColor = [UIColor orangeColor];
        UILabel *lab = (UILabel *)view;
        lab.font = [UIFont boldSystemFontOfSize:14];
        cell.contentView.backgroundColor = [UIColor yellowColor];
    }];
    one2.height=100;
    
    /**给定默认的视图 UISwitch*/
    HRefreshModel *one3 = [[HRefreshModel alloc]initWithTitle:@"青铜" imageName:@"stage_5" assistType:HSwitchType func:^(UIView *assistView) {
        
    } ];
    [one3 setSwitchInitStatus:NO];
    one3.height=100;
    
    /**没有辅助视图*/
    HRefreshModel *one4 = [[HRefreshModel alloc]initWithTitle:@"砖石" imageName:@"stage_7" assistType:HCustomType func:^(UIView *assistView) {
        
    }];
    UIButton *button= [UIButton new];
    button.backgroundColor = [UIColor redColor];
    button.frame =CGRectMake(0, 0, 100, 30);
    [one4 setAssistView:button];
    one4.height=80;
    
    /**自定义辅助视图*/
    HRefreshModel *one5 =[[HRefreshModel alloc]initWithTitle:@"黄金" imageName:@"stage_4" assistView:^UIView *{
        return [[UISegmentedControl alloc]initWithItems:@[@"one",@"two"]];
    } func:^(UIView *assistView) {
        
    } ];
    one5.height = 88;
    
    groupOne.headTitle = @"第一组";
    [groupOne.items addObject:one1];
    [groupOne.items addObject:one2];
    [groupOne.items addObject:one3];
    [groupOne.items addObject:one4];
    [groupOne.items addObject:one5];
    [self.dataArray addObject:groupOne];
    
    
    
    HItemGroup *groupTwo = [HItemGroup group];
    
    HArrowModel *two3 = [[HArrowModel alloc]initWithTitle:@"黄金" imageName:@"stage_4" func:^(UIView *assistView) {
        
    } clazz:[resultViewC class]];
    
    HArrowModel *two4 = [[HArrowModel alloc]initWithTitle:@"白金" imageName:@"stage_5" func:^(UIView *assistView) {
        
    } clazz:[resultViewC class] assistV:HLableType];
    [two4 setAssistLableText:@"跳转"];
    
    
    
    HArrowModel *two5 = [[HArrowModel alloc]initWithTitle:@"大师" imageName:@"stage_6" func:^(UIView *assistView) {
        
    } clazz:[resultViewC class] assistView:^UIView *{
        return  [[UISwitch alloc]init];
    }];
    
    groupTwo.headTitle = @"第二组";
    [groupTwo.items addObject:two3];
    [groupTwo.items addObject:two4];
    [groupTwo.items addObject:two5];
    [self.dataArray addObject:groupTwo];
    
    
    
    
    HItemGroup *groupThere = [HItemGroup group];
    HArrowModel *there1 = [[HArrowModel alloc]initWithTitle:@"------->" imageName:@"" func:nil clazz:[sourceViewcontroller class]];
    [groupThere.items addObject:there1];
    groupThere.headTitle =@"怎么处理上下控制器之间传递值";
    [self.dataArray addObject:groupThere];
    
}
@end
