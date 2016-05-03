//
//  WHMeTableViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMeTableViewController.h"

@interface WHMeTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *myCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondConstraint;

@end

@implementation WHMeTableViewController
-(void)updateViewConstraints{
    self.secondConstraint.constant= ([UIScreen mainScreen].bounds.size.width-22*2-50*4)/3;
    self.thirdConstraint.constant = self.secondConstraint.constant;
    [super updateViewConstraints];
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self updateViewConstraints];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.autoresizesSubviews = YES;
    self.myCell.backgroundColor = [UIColor clearColor];
    
    
    self.myCell.accessoryView.backgroundColor = [UIColor clearColor];
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 3;
            break;
    }
    return 0;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell;
//    if (indexPath.section ==0) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"MeCell"];
//        cell.backgroundColor = [UIColor clearColor];
////        cell.accessoryView.backgroundColor = [UIColor clearColor];
//    }else if(indexPath.section == 1){
//        if (indexPath.row == 0) {
//            cell = [tableView dequeueReusableCellWithIdentifier:@"DealTitleCell"];
//        }else{
//            cell = [tableView dequeueReusableCellWithIdentifier:@"DealDetailCell"];
//        }
//    }else if(indexPath.section == 2){
//        if (indexPath.row == 1) {
//            cell = [tableView dequeueReusableCellWithIdentifier:@"PacketTitleCell"];
//        }else{
//            cell = [tableView dequeueReusableCellWithIdentifier:@"PacketDetailCell"];
//        }
//        
//    }else{
//        cell= [tableView dequeueReusableCellWithIdentifier:@"OtherCell"];
//    }
//    
//    
//    // Configure the cell...
//    
//    return cell;
//}


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

@end
