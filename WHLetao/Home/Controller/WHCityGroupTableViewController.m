//
//  WHCityGroupTableViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/6.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHCityGroupTableViewController.h"
#import "UIColor+FlatUI.h"
@interface WHCityGroupTableViewController ()
@property(nonatomic,strong) CITY_BLOCK cityBlock;
@property(nonatomic,strong) NSArray *cityGroupArray;
@property(nonatomic,strong) NSArray *cityFirstLetterArray;
@end

@implementation WHCityGroupTableViewController
+(instancetype)cityGroupTableViewControllerDidChoice:(CITY_BLOCK)cityBlock{
    WHCityGroupTableViewController *cityController = [[self alloc]init];
    cityController.cityBlock = cityBlock;
    return cityController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionIndexColor = [UIColor colorFromHexCode:@"eb5352"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    WHCityGroup *cityGroup = self.cityGroupArray[section];
    NSArray *cityArray =cityGroup.cities;
    return cityArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    WHCityGroup *cityGroup = self.cityGroupArray[indexPath.section];
    NSArray *cityArray = cityGroup.cities;
    cell.textLabel.text = cityArray[indexPath.row];
    
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WHCityGroup *cityGroup = self.cityGroupArray[section];
    return cityGroup.title;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WHCityGroup *cityGroup = self.cityGroupArray[indexPath.section];
    NSArray *cityArray = cityGroup.cities;
    NSLog(@"%ld",indexPath.row);
    self.cityBlock(cityArray[indexPath.row]);
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.cityFirstLetterArray;
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


- (NSArray *)cityGroupArray {
	if(_cityGroupArray == nil) {
        _cityGroupArray = [WHMetaDataTool getALLCityGroups];
        
	}
	return _cityGroupArray;
}



- (NSArray *)cityFirstLetterArray {
	if(_cityFirstLetterArray == nil) {
        NSMutableArray *mutaArr = [NSMutableArray array];
        for (WHCityGroup *cityGroup in self.cityGroupArray) {
            [mutaArr addObject:cityGroup.title];
        }
        _cityFirstLetterArray = [mutaArr copy];
	}
	return _cityFirstLetterArray;
}

@end
