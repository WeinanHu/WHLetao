//
//  WHSearchViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHSearchViewController.h"

@interface WHSearchViewController ()<UISearchBarDelegate>
@property(nonatomic,strong) UISearchBar *searchBar;
@end

@implementation WHSearchViewController
-(void)viewWillAppear:(BOOL)animated{
    if (!self.searchBar) {
        [self setUpSearchBar];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    if (self.searchBar) {
        self.navigationItem.titleView = nil;
        self.searchBar = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSearchBar];
    [self loadNewDeals];
    //添加
    // Do any additional setup after loading the view.
}
-(void)setUpSearchBar{
    self.searchBar = [[UISearchBar alloc]init];
//    self.searchBar.frame = CGRectMake(0, 0, 200, 40);
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入商品名、商户名、地址等";
    self.navigationItem.titleView =self.searchBar;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:nil];
}

-(void)settingRequestParams:(NSMutableDictionary*)params{
    params[@"city"]= @"北京";
    if (self.searchBar.text.length == 0) {
        
    }else{
        params[@"keyword"]= self.searchBar.text;
    }
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self loadNewDeals];
    [searchBar resignFirstResponder];
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
