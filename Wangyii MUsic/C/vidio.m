//
//  vidio.m
//  Wangyii MUsic
//
//  Created by 岳靖翔 on 2019/7/25.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "vidio.h"

@interface vidio ()

@end

@implementation vidio

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* image = [UIImage imageNamed:@"2.png"];
    UITabBarItem *tab1= [[UITabBarItem alloc]initWithTitle:@"视频" image:image tag:2];
    self.tabBarItem =tab1;
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
