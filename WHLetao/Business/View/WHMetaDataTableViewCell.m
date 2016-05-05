//
//  WHMetaDataTableViewCell.m
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMetaDataTableViewCell.h"

@implementation WHMetaDataTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView withImageName:(NSString *)imageName withSelectedImageName:(NSString *)selectedImageName{
    //重用机制
    static NSString *identifier = @"cell";
    WHMetaDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[WHMetaDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];           
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:selectedImageName]];
    
    return cell;
    //设置cell字体大小；背景图片
    
}
@end
