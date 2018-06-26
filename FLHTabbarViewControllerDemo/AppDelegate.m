//
//  AppDelegate.m
//  FLHTabbarViewControllerDemo
//
//  Created by mac on 2018/6/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "FLHNavigationController.h"
#import "FLHTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.frame = [[UIScreen mainScreen] bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSString *loginState = [[NSUserDefaults standardUserDefaults] objectForKey:@"LoginStateLocalSave"];
    if (loginState == nil || loginState.length == 0) {
        [self gotoLoginAPP];
    }else{
        [self gotoAPPHomePage];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)gotoAPPHomePage{
    
    HomeViewController *HomeVC = [[HomeViewController alloc] init];
    UIImage *homeImage = [UIImage imageNamed:@"icon_message_gray"];
    UIImage *homeSelectImage = [UIImage imageNamed:@"icon_message_green"];
    homeImage = [homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeSelectImage = [homeSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *homeBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:homeImage selectedImage:homeSelectImage];
    HomeVC.tabBarItem = homeBarItem;
    FLHNavigationController *homeNav = [[FLHNavigationController alloc] initWithRootViewController:HomeVC];
    
    MineViewController *MineVC = [[MineViewController alloc] init];
    UIImage *mineImage = [UIImage imageNamed:@"icon_my_gray"];
    UIImage *mineSelectImage = [UIImage imageNamed:@"icon_my_green"];
    mineImage = [mineImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineSelectImage = [mineSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *mineBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:mineImage selectedImage:mineSelectImage];
    MineVC.tabBarItem = mineBarItem;
    FLHNavigationController *mineNav = [[FLHNavigationController alloc] initWithRootViewController:MineVC];
    
    FLHTabBarController *tabBarVC = [[FLHTabBarController alloc] init];
    tabBarVC.viewControllers = [NSArray arrayWithObjects:homeNav, mineNav, nil];
 //   [tabBarVC setSelectedIndex:0];
    self.window.rootViewController = tabBarVC;
}

- (void)gotoLoginAPP{
    ViewController *VC = [[ViewController alloc] init];
    self.window.rootViewController = VC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
