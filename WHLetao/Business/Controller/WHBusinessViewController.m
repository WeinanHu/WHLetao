//
//  WHBusinessViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHBusinessViewController.h"
#import "WHBusinessHeaderView.h"
#import "MJRefresh.h"
#import "UIView+Extension.h"
#import "WHSortViewController.h"
#import "WHRegionViewController.h"
#import "WHCategoryViewController.h"
#import "WHSearchViewController.h"
#import "WHMetaDataTool.h"
@interface WHBusinessViewController ()<UIPopoverPresentationControllerDelegate>
@property(nonatomic,strong) WHBusinessHeaderView *headerView;
@property(nonatomic,strong) WHSortViewController *sortController;
@property(nonatomic,strong) WHRegionViewController *regionController;
@property(nonatomic,strong) WHCategoryViewController *categoryController;
@property(nonatomic,strong) WHSearchViewController *searchController;
@property(nonatomic,strong) NSArray *sorts;
@end

@implementation WHBusinessViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.y = 50;
    [self setUpHeadView];
    [self addTargetsForButton];
    [self addSearchButton];
}
#pragma mark - button
-(void)addSearchButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStyleDone target:self action:@selector(clickSearchButton)];
    
}
-(void)clickSearchButton{
    [self.navigationController pushViewController:self.searchController animated:YES];
}
-(void)addTargetsForButton{
    [self.headerView.sortButton addTarget:self action:@selector(clickSortButton) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.regionButton addTarget:self action:@selector(clickRegionButton) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.categoryButton addTarget:self action:@selector(clickCategoryButton) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)clickRegionButton{
    self.regionController.modalPresentationStyle = UIModalPresentationPopover;
    self.regionController.popoverPresentationController.sourceView = self.headerView.regionButton;
    self.regionController.popoverPresentationController.sourceRect = self.headerView.regionButton.bounds;//直接给bounds就行，相当于宽度一半，高度为1倍的位置。
    self.regionController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    self.regionController.popoverPresentationController.delegate = self;
    [self presentViewController:self.regionController animated:YES completion:nil];
}
-(void)clickCategoryButton{
    self.categoryController.modalPresentationStyle = UIModalPresentationPopover;
    self.categoryController.popoverPresentationController.sourceView = self.headerView.categoryButton;
    self.categoryController.popoverPresentationController.sourceRect = self.headerView.categoryButton.bounds;//直接给bounds就行，相当于宽度一半，高度为1倍的位置。
    self.categoryController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    self.categoryController.popoverPresentationController.delegate = self;
    [self presentViewController:self.categoryController animated:YES completion:nil];
}
-(void)clickSortButton{
    self.sortController.modalPresentationStyle = UIModalPresentationPopover;
    self.sortController.popoverPresentationController.sourceView = self.headerView.sortButton;
    self.sortController.popoverPresentationController.sourceRect = self.headerView.sortButton.bounds;//直接给bounds就行，相当于宽度一半，高度为1倍的位置。
    self.sortController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    self.sortController.popoverPresentationController.delegate = self;
    
    self.sortController.preferredContentSize = CGSizeMake(130, 15+45*self.sorts.count);
    for(int i = 0;i<self.sorts.count;i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [button setTitle:((WHSort*)self.sorts[i]).label forState:UIControlStateNormal];
        button.frame = CGRectMake(15, 15+45*i, 100, 30);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = 100+i;
        [self.sortController.view addSubview:button];
    }
    [self presentViewController:self.sortController animated:YES completion:nil];
}
-(void)setUpHeadView{
    self.headerView = [[NSBundle mainBundle]loadNibNamed:@"WHBusinessHeaderView" owner:nil options:nil].lastObject;
    self.headerView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50);
    [self.view addSubview:self.headerView];
}

#pragma mark - request参数
-(void)settingRequestParams:(NSMutableDictionary*)params{
#warning TODO:设置四个参数
    params[@"city"]     = @"北京";
    params[@"category"] = @"美食";
    params[@"region"]   = @"朝阳区";
    params[@"sort"]     = @2;
}

#pragma mark - UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 懒加载

- (WHSortViewController *)sortController {
	if(_sortController == nil) {
		_sortController = [[WHSortViewController alloc] init];
        
	}
	return _sortController;
}

- (WHRegionViewController *)regionController {
	if(_regionController == nil) {
		_regionController = [[WHRegionViewController alloc] init];
	}
	return _regionController;
}

- (WHCategoryViewController *)categoryController {
	if(_categoryController == nil) {
		_categoryController = [[WHCategoryViewController alloc] init];
	}
	return _categoryController;
}

- (NSArray *)sorts {
	if(_sorts == nil) {
		_sorts = [WHMetaDataTool getAllSorts];
	}
	return _sorts;
}

- (WHSearchViewController *)searchController {
	if(_searchController == nil) {
		_searchController = [[WHSearchViewController alloc] init];
	}
	return _searchController;
}

@end
