//
//  HCell.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//
#define Swidth [UIScreen mainScreen].bounds.size.width
#define Sheight [UIScreen mainScreen].bounds.size.height
#import "HCell.h"
@interface HCell()
@property(nonatomic,strong)UIView *assistView;
@end
@implementation HCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * ID =@"HCell";
    HCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell=[[HCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(void)setModel:(HCellModel *)model{
    _model = model;
    [self initSubView];
}
-(void)initSubView{
    if ([self.model isMemberOfClass:[HCellModel class]]) {return;}
    [self.assistView removeFromSuperview];
    self.assistView=nil;
    self.textLabel.text = self.model.title;
    self.textLabel.font = cellLableFont;
    self.imageView.image= [UIImage imageNamed:self.model.imageName];
    self.assistView = self.model.assistView;
    if ([self.model isKindOfClass:[HRefreshModel class]]) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }else{
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    UIView *assistView =self.model.assistView;
    assistView.frame = [self rectWithView:assistView];
    [self.contentView addSubview:assistView];
    
    addAttributeAction func = objc_getAssociatedObject(self.model, @"attribute");
    if (func) {func(self,self.model.assistView);}
}

-(CGRect)rectWithView:(UIView *)view{
    CGRect rect;
    if(self.accessoryType == UITableViewCellAccessoryNone){
        rect.size.width = view.bounds.size.width<assistViewMaxWidth? view.bounds.size.width:assistViewMaxWidth;
        rect.size.height = view.bounds.size.height>cellHeight?cellHeight:view.bounds.size.height;
        rect.origin.x = Swidth - rect.size.width-10;
        rect.origin.y = (cellHeight-rect.size.height)/2;
    }else{
        rect.size.width = view.bounds.size.width<assistViewMaxWidth? view.bounds.size.width:assistViewMaxWidth;
        rect.size.height = view.bounds.size.height>cellHeight?cellHeight:view.bounds.size.height;
        rect.origin.x = Swidth - rect.size.width-34;
        rect.origin.y = (cellHeight-rect.size.height)/2;
    }
    return rect;
}
@end