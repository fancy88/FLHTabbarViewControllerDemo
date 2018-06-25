//
//  MineViewController.m
//  FLHTabbarViewControllerDemo
//
//  Created by mac on 2018/6/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MineViewController.h"
#import "AppDelegate.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"哈哈";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    exitBtn.frame = CGRectMake(self.view.frame.size.width / 2.0 - 60, 200, 120, 40);
    exitBtn.backgroundColor = [UIColor cyanColor];
    [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [exitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(exitBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitBtn];
    // Do any additional setup after loading the view.
}

- (void)exitBtnAction: (UIButton *)button{
    NSLog(@"退出登录");
    [[NSUserDefaults standardUserDefaults] setObject:@"login" forKey:@""];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate gotoLoginAPP];
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
