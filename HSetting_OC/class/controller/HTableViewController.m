//
//  HTableViewController.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "HTableViewController.h"
@interface HTableViewController()
@property(nonatomic,strong)UIViewController *targetVC;
@property(nonatomic,strong)NSIndexPath *currentIndex;
@end
@implementation HTableViewController
-(NSMutableArray *)dataArray{
    if (nil==_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(void)viewDidLoad{
    [super viewDidLoad];
}
-(void)loadData{}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.currentIndex&&self.targetVC) {
        HItemGroup *one = self.dataArray[self.currentIndex.section];
        HCellModel *model = one.items[self.currentIndex.row];
        NSString *propertyName = objc_getAssociatedObject(model, @"transfer");
        if (propertyName) {
            NSString *value = [self.targetVC valueForKey:propertyName];
            [model setAssistLableText:value];
        }else{
            NSString *proper = objc_getAssociatedObject(model, @"propertyName");
            transitiveBlock block = objc_getAssociatedObject(model, @"transitiveValue");
            newValue valueBlock =objc_getAssociatedObject(model, @"complement");
            if (block&&valueBlock) {
                id  value = [self.targetVC valueForKey:proper];
                valueBlock(value,model.assistView);
            }
        }
        [self.tableView reloadRowsAtIndexPaths:@[self.currentIndex] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.targetVC=nil;
    self.currentIndex = nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HItemGroup *one = self.dataArray[section];
    return one.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HItemGroup *group = self.dataArray[indexPath.section];
    HCellModel *model = group.items[indexPath.row];
    return  model.height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return SectionHeadHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section+1 == self.dataArray.count) {
        return  0.1;
    }
    return sectionFooterHeight;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    HItemGroup *one = self.dataArray[section];
    return one.headTitle;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    HItemGroup *one = self.dataArray[section];
    return one.footTitle;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HCell *cell = [HCell cellWithTableView:tableView];
    HItemGroup *one = self.dataArray[indexPath.section];
    cell.model = one.items[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
    HItemGroup *one = self.dataArray[indexPath.section];
    HCellModel *model = one.items[indexPath.row];
    if (model.function) {model.function(model.assistView);}
    if ([model isKindOfClass:[HArrowModel class]]) {
        HArrowModel *currentModel = (HArrowModel *)model;
        UIViewController *target = [[currentModel.clazz alloc]init];
        /**传递值得操作*/
        NSString *propertyName  = objc_getAssociatedObject(currentModel, @"transfer");
        if (propertyName) {
            if ([currentModel.assistView isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)currentModel.assistView;
                NSString *value = label.text;
                [self operationtarget:target name:propertyName value:value index:indexPath model:currentModel];
            }
        }else if(objc_getAssociatedObject(currentModel, @"propertyName")){
            NSString *proper = objc_getAssociatedObject(currentModel, @"propertyName");
            transitiveBlock block = objc_getAssociatedObject(currentModel, @"transitiveValue");
            newValue value =objc_getAssociatedObject(currentModel, @"complement");
            if (block&&value) {
                [self operationtarget:target name:proper value:block(currentModel.assistView) index:indexPath model:currentModel];
            }
        }
        if(self.navigationController){
            [self.navigationController pushViewController:target animated:true];
        }else{
            UINavigationController *NaviVC= [[UINavigationController alloc]initWithRootViewController:target];
            [self presentViewController:NaviVC animated:true completion:nil];
        }
    }
}

-(void)operationtarget:(UIViewController *)target name:(NSString *)ProName value:(id)value index:(NSIndexPath *)index model:(HArrowModel *)model {
    unsigned int num;
    objc_property_t *pros =  class_copyPropertyList(target.class, &num);
    for (int i=0; i<num; i++) {
        NSString *name = [[NSString alloc]initWithUTF8String:property_getName(pros[i])];
        if ([name isEqualToString:ProName]) {
            if (value) {
                [target setValue:value forKey:name];
                self.targetVC = target;
                self.currentIndex = index;
            }
        }
    }
}
@end
