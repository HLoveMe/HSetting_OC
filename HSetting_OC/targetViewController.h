//
//  targetViewController.h
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HArrowModel.h"
@interface targetViewController : UIViewController
@property(nonatomic,copy)NSString *currentTitle;
@property(nonatomic,strong)UIButton *button;



@property(nonatomic,strong)HArrowModel *arrowModel;
@end
