//
//  WHMainTableViewCell.h
//  WHLetao
//
//  Created by Wayne on 16/5/4.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHDeal.h"
@interface WHMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dealImageView;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellCountLabel;
@property(nonatomic,strong) WHDeal *deal;
@end
