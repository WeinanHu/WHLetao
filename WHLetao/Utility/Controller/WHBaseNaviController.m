//
//  WHBaseNaviController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHBaseNaviController.h"
#import "DPAPI.h"
#import "WHMetaDataTool.h"
@interface WHBaseNaviController ()<DPRequestDelegate>

@end

@implementation WHBaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20)];
    view.backgroundColor = [UIColor redColor];
    [self.navigationBar addSubview:view];
    self.navigationBar.backgroundColor = [UIColor redColor];
    
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    //验证所有订单数据
    DPAPI *api = [[DPAPI alloc]init];
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    paramsDic[@"city"]=@"北京" ;
    [api requestWithURL:@"v1/deal/find_deals" params:paramsDic delegate:self];
//    [self sendRequestToServer];
    // Do any additional setup after loading the view.
}
#pragma mark - DPRequest delegate
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    //成功
    NSLog(@"%@",result);
    NSArray *dealsArray = [WHMetaDataTool parseDealsResult:result];
    NSLog(@"%@",dealsArray);
    
}
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    //失败
    NSLog(@"%@",error.userInfo);
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
