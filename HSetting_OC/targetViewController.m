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
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(self.currentTitle);
    self.currentTitle = @"朱子豪BBB";
    
    self.button.frame = CGRectMake(0, 0, 100, 100);
    self.button.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button];
    
    [self.arrowModel setTitle:@"New Model"];
}
@end
