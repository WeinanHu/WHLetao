//
//  WHHomeViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHHomeViewController.h"
#import "TRLocationManager.h"
#import "WHCityGroupTableViewController.h"
@interface WHHomeViewController ()
@property(nonatomic,strong) NSString *cityName;

@end

@implementation WHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"城市" style:UIBarButtonItemStyleDone target:self action:@selector(clickCityButton)];
    [self getUserLocation];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)getUserLocation{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"UserLocationCity"]) {
        self.cityName = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserLocationCity"];
        self.navigationItem.rightBarButtonItem.title = self.cityName;
    }
    
    [TRLocationManager getUserCityName:^(NSString *cityName) {
        self.cityName = cityName;
        [self loadNewDeals];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.rightBarButtonItem.title = self.cityName;
            [[NSUserDefaults standardUserDefaults]setObject:self.cityName forKey:@"UserLocationCity"];
        });
    }];
}
-(void)clickCityButton{
    WHCityGroupTableViewController *cityGroupController = [WHCityGroupTableViewController cityGroupTableViewControllerDidChoice:^(NSString *cityName) {
        self.cityName = cityName;
        [self loadNewDeals];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSUserDefaults standardUserDefaults]setObject:self.cityName forKey:@"UserLocationCity"];
            self.navigationItem.rightBarButtonItem.title = self.cityName;
        });
    }];
    [self.navigationController pushViewController:cityGroupController animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)settingRequestParams:(NSMutableDictionary*)params{
#warning TODO:设置城市和分类
    params[@"city"]= self.cityName;
    if (params[@"city"]==nil) {
        params[@"city"]     = @"北京";
    }
    
    params[@"category"] = @"美食";

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
