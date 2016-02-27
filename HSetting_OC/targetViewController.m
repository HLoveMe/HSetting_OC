//
//  targetViewController.m
//  HSetting_OC
//
//  Created by space on 16/2/27.
//  Copyright © 2016年 Space. All rights reserved.
//

#import "targetViewController.h"

@implementation targetViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(self.currentTitle);
    self.currentTitle = @"朱子豪";
    
    self.button.frame = CGRectMake(0, 0, 100, 100);
    
    [self.arrowModel setTitle:@"New Model"];
}
@end
