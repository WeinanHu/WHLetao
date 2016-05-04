//
//  WHBaseNaviController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHBaseNaviController.h"

@interface WHBaseNaviController ()

@end

@implementation WHBaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20)];
//    view.backgroundColor = [UIColor redColor];
//    [self.navigationBar addSubview:view];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.902 green:0.224 blue:0.239 alpha:1.000]];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
//    if ([[WHBaseNaviController class] respondsToSelector:@selector(appearance)])
//    {
//        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed: 4.0/255.0 green:173.0/255.0 blue:214.0/255.0 alpha:1.0f ]]; //// change background color of navigationBar
//        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]]; /// set backButton color of navigation bar
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]; // set title color
////        [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];  /// set all barButton item color
//        self.navigationBar.translucent = NO;// set translucent NO
//    }
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationItem.titleView.tintColor = [UIColor whiteColor];
    
//    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    //验证所有订单数据
//    DPAPI *api = [[DPAPI alloc]init];
//    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
//    paramsDic[@"city"]=@"北京" ;
    
//    [self sendRequestToServer];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleDefault;
    
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
