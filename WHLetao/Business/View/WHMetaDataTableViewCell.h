//
//  WHMetaDataTableViewCell.h
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHMetaDataTableViewCell : UITableViewCell
//参数tableView、两个背景图片名字，返回WHMetaDataTableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView withImageName:(NSString*)imageName withSelectedImageName:(NSString*)selectedImageName;


@end
