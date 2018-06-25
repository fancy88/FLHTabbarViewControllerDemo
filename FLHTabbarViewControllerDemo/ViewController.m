//
//  ViewController.m
//  FLHTabbarViewControllerDemo
//
//  Created by mac on 2018/6/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(self.view.frame.size.width / 2.0 - 60, 200, 120, 40);
    loginBtn.backgroundColor = [UIColor cyanColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loginBtnAction: (UIButton *)button{
    NSLog(@"登录");
    [[NSUserDefaults standardUserDefaults] setObject:@"login" forKey:@"LoginStateLocalSave"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate gotoAPPHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
