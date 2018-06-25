//
//  FLHTabBarController.m
//  FLHTabbarViewControllerDemo
//
//  Created by mac on 2018/6/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FLHTabBarController.h"

@interface FLHTabBarController ()

@end

@implementation FLHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UIColor *titleHighlightedColor = [UIColor colorWithRed:57.0/255.0 green:170.0/255.0 blue:236.0/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleHighlightedColor, NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    
     [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//白色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
