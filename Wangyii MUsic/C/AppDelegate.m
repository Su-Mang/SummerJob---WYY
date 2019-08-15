//
//  AppDelegate.m
//  Wangyii MUsic
//
//  Created by 岳靖翔 on 2019/7/25.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "AppDelegate.h"
#import "Find.h"
#import "vidio.h"
#import "MY.h"
#import "Zh.h"
#import "Friend.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    //创建一组视图控制器
    Find* vc01 = [[Find alloc]init];
    vc01.view.backgroundColor = [UIColor whiteColor];
    vidio* vc02 = [[vidio alloc]init];
     vc02.view.backgroundColor = [UIColor whiteColor];
    MY *vc03 =  [[MY alloc]init];
     vc03.view.backgroundColor = [UIColor whiteColor];
    Friend *vc04 =[[Friend alloc]init];
     vc04.view.backgroundColor = [UIColor whiteColor];
    Zh *vc05 = [[Zh alloc]init];
     vc05.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:vc03];
     UINavigationController *nav1 =[[UINavigationController alloc]initWithRootViewController:vc05];
    NSArray *arrayvc = [NSArray arrayWithObjects:vc01,vc02,nav,vc04,nav1 ,nil];
    [self.window makeKeyAndVisible];
    UITabBarController *tbc = [[UITabBarController alloc]init];
    tbc.tabBar.tintColor = [UIColor redColor];
   tbc.viewControllers = arrayvc;
    self.window.rootViewController =tbc;
   
    tbc.selectedIndex = 4;
    
    return YES;
    
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
