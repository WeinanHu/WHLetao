//
//  WHBaseTableTableViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHBaseTableTableViewController.h"
#import "WHMainTableViewCell.h"
#import "UIView+Extension.h"

@interface WHBaseTableTableViewController ()<DPRequestDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) DPRequest *latestRequest;
@end

@implementation WHBaseTableTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    [self sendRequestToServer];
    [self setUpTableView];
    
    [self setUpRefresh];
    
    self.page = 1;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark - mj_refresh
-(void)setUpRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDeals)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDeals)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)sendRequestToServer {
    DPAPI *api = [DPAPI new];
    /*调用子类的设置参数逻辑(方法)
     主页：用户选择哪个按钮+city
     商家：category+region+sort+city
     搜索：keyword+city
     地图：latitude+longitude+radius+city
     */
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    [self settingRequestParams:paramsDic];
    paramsDic[@"page"] = [NSNumber numberWithInteger:self.page];
    self.latestRequest = [api requestWithURL:@"v1/deal/find_deals" params:paramsDic delegate:self];
}
-(void)loadNewDeals{
    //page = 1
    self.page = 1;

    [self sendRequestToServer];
}
-(void)loadMoreDeals{
    //page++
    self.page++;
    [self sendRequestToServer];
}
#pragma mark -- DPRequestDelegate
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    NSArray *array = [WHMetaDataTool parseDealsResult:result];
    if (self.latestRequest != request) {
        return;
    }
    if (self.page == 1) {
        [self.dealsArray removeAllObjects];
    }
    
    [self.dealsArray addObjectsFromArray:array];
    [self.tableView reloadData];
    
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - tableView
-(void)setUpTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.y += 64;
    [self.tableView registerNib:[UINib nibWithNibName:@"WHMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"dealCell"];
}
-(void)settingRequestParams:(NSMutableDictionary*)params{
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dealsArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WHMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dealCell" forIndexPath:indexPath];
    WHDeal *deal = self.dealsArray[indexPath.row];
    cell.deal = deal;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    WHDeal *deal = self.dealsArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:deal.deal_h5_url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    UIViewController *vc = [UIViewController new];
    [vc.view addSubview:webView];
    
//    self.tabBarController.hidesBottomBarWhenPushed = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSMutableArray *)dealsArray {
    if(_dealsArray == nil) {
        _dealsArray = [[NSMutableArray alloc] init];
    }
    return _dealsArray;
}
@end
