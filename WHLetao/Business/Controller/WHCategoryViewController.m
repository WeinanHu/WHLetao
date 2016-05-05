//
//  WHCategoryViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/4.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHCategoryViewController.h"
#import "WHMetaDataTableViewCell.h"
#import "WHMetaDataView.h"
#import "WHMetaDataTool.h"
@interface WHCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) WHMetaDataView *metaDataView;
@property(nonatomic,strong) NSArray *categoryArray;
@end

@implementation WHCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(260, 400);
    [self addMetaDataView];
    
}
-(void)addMetaDataView{
    self.metaDataView = [WHMetaDataView getMetaDataView];
    self.metaDataView.mainTableView.dataSource = self;
    self.metaDataView.mainTableView.delegate = self;
    self.metaDataView.subTableView.dataSource = self;
    self.metaDataView.subTableView.delegate = self;
    
    self.view =self.metaDataView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.metaDataView.mainTableView) {
        return self.categoryArray.count;
    }else{
        
        WHCategory *category = self.categoryArray[self.metaDataView.mainTableView.indexPathForSelectedRow.row];
        return category.subcategories.count;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if(tableView == self.metaDataView.mainTableView){
        cell = [WHMetaDataTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_leftpart" withSelectedImageName:@"bg_dropdown_left_selected"];
        WHCategory *category = self.categoryArray[indexPath.row];
        cell.textLabel.text = category.name;
        cell.imageView.image = [UIImage imageNamed:category.icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        if (category.subcategories.count>0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else{
        cell = [WHMetaDataTableViewCell cellWithTableView:tableView withImageName:@"bg_dropdown_rightpart" withSelectedImageName:@"bg_dropdown_right_selected"];
        WHCategory *category = self.categoryArray[self.metaDataView.mainTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = category.subcategories[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.metaDataView.mainTableView) {
        [self.metaDataView.subTableView reloadData];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (NSArray *)categoryArray {
	if(_categoryArray == nil) {
		_categoryArray = [WHMetaDataTool getAllCategories];
	}
	return _categoryArray;
}

@end
