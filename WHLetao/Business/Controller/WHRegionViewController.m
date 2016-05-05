//
//  WHRegionViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/4.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHRegionViewController.h"
#import "WHMetaDataTool.h"
#import "WHMetaDataView.h"
#import "WHMetaDataTableViewCell.h"
@interface WHRegionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSArray *regionArray;


@property(nonatomic,strong) WHMetaDataView *metaDataView;
@end

@implementation WHRegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(260, 400);
    self.regionArray = [WHMetaDataTool getAllRegionsByCityName:@"北京"];
    [self addMetaDataView];
    // Do any additional setup after loading the view.
}
-(void)addMetaDataView{
    self.metaDataView = [WHMetaDataView getMetaDataView];
    self.metaDataView.mainTableView.dataSource = self;
    self.metaDataView.mainTableView.delegate = self;
    self.metaDataView.subTableView.dataSource = self;
    self.metaDataView.subTableView.delegate = self;
    
    self.view =self.metaDataView;
    
}

#pragma mark - datasource/delegate
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    //mainTableView
    if (tableView == self.metaDataView.mainTableView) {
        return 1;
    }else{
    //subTabeleView
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.metaDataView.mainTableView) {
        return self.regionArray.count;
    }else{
        //subTabeleView
        
        NSInteger selectedRow = self.metaDataView.mainTableView.indexPathForSelectedRow.row;
        WHRegion *region = self.regionArray[selectedRow];
        
        return region.subregions.count;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //mainTableView
    WHMetaDataTableViewCell *cell;
    if (tableView == self.metaDataView.mainTableView) {
        cell = [WHMetaDataTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        WHRegion *region = self.regionArray[indexPath.row];
        
        cell.textLabel.text = region.name;
        if (region.subregions.count>0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }else{
        //subTabeleView
        cell = [WHMetaDataTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        WHRegion *region = self.regionArray[self.metaDataView.mainTableView.indexPathForSelectedRow.row];
        
        cell.textLabel.text = region.subregions[indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        

    }

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.metaDataView.mainTableView) {
        [self.metaDataView.subTableView reloadData];
    }
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

- (NSArray *)regionArray {
	if(_regionArray == nil) {
		_regionArray = [WHMetaDataTool getAllRegionsByCityName:@"北京"];
	}
	return _regionArray;
}

@end
