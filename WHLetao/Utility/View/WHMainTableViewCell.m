//
//  WHMainTableViewCell.m
//  WHLetao
//
//  Created by Wayne on 16/5/4.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMainTableViewCell.h"

#import "UIImageView+WebCache.h"
@implementation WHMainTableViewCell
-(void)setDeal:(WHDeal *)deal{
    _deal = deal;
//    NSString *str = deal.s_image_url;
//    NSURLSession *session = [NSURLSession se]
//    self.dealImageView.image = [UIImage imageWithData:data];
    long currentPrice = [deal.current_price doubleValue]*100;
    long currentPricePercentile = currentPrice%10;
    long currentPriceCentile = currentPrice%100/10;
    NSString *currentPriceStr = [NSString stringWithFormat:@"%ld%@%@",currentPrice/100,(currentPriceCentile==0&&currentPricePercentile==0)?@"":[NSString stringWithFormat:@".%@",@(currentPriceCentile)],(currentPricePercentile==0)?@"":@(currentPricePercentile)];
    
    long originalPrice = [deal.list_price doubleValue]*100;
    long originalPricePercentile = originalPrice%10;
    long originalPriceCentile = originalPrice%100/10;
    NSString *originalPriceStr = [NSString stringWithFormat:@"%ld%@%@",originalPrice/100,(originalPriceCentile==0&&originalPricePercentile==0)?@"":[NSString stringWithFormat:@".%@",@(originalPriceCentile)],(originalPricePercentile==0)?@"":@(originalPricePercentile)];
    
    [self.dealImageView sd_setImageWithURL:[NSURL URLWithString:deal.s_image_url]];
    self.discountLabel.text = [NSString stringWithFormat:@"%.2f%%折扣",100.0*(1-1.0*currentPrice/originalPrice)];
    self.currentPriceLabel.text = [NSString stringWithFormat:@"￥%@",currentPriceStr];
    self.originalPriceLabel.text = [NSString stringWithFormat:@"￥%@",originalPriceStr];
    self.dealLabel.text = deal.title;
    NSString *strPurCount;
    if ([deal.purchase_count integerValue]>=10000) {
        strPurCount = [NSString stringWithFormat:@"%.2f万份",[deal.purchase_count integerValue]/10000.0];
    }else{
        strPurCount = [NSString stringWithFormat:@"%@份",deal.purchase_count];
    }
    self.sellCountLabel.text =[NSString stringWithFormat:@"已售:%@",strPurCount];
    
}
- (void)awakeFromNib {
    // Initialization code

//    CGSize size = [self.costLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX,CGFLOAT_MAX)];
//    self.costLabel.frame = CGRectMake(self.costLabel.frame.origin.x, self.costLabel.frame.origin.y, size.width, size.height);
//    size = [self.originalCostLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX,CGFLOAT_MAX)];
//    self.originalCostLabel.frame = CGRectMake(self.originalCostLabel.frame.origin.x, self.originalCostLabel.frame.origin.y, size.width, size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
