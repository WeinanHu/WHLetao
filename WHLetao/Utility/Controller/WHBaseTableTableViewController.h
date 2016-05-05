//
//  WHBaseTableTableViewController.h
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPAPI.h"
#import "WHMetaDataTool.h"
#import "MJRefresh.h"
@interface WHBaseTableTableViewController : UIViewController
-(void)settingRequestParams:(NSMutableDictionary*)params;
@property(nonatomic,strong) NSMutableArray *dealsArray;

@property(nonatomic,assign) NSInteger page;
@property(nonatomic,strong) UITableView *tableView;

-(void)loadNewDeals;
@end
