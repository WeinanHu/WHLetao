//
//  WHDeal.h
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHDeal : NSObject

/**订单标题 */
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSNumber *list_price;
@property(nonatomic,strong) NSNumber *current_price;
@property(nonatomic,strong) NSArray *categories;
@property(nonatomic,strong) NSNumber *purchase_count;
@property(nonatomic,copy) NSString *purchase_deadline;
@property(nonatomic,copy) NSString *s_image_url;
@property(nonatomic,copy) NSString *deal_h5_url;
@property(nonatomic,strong) NSArray *businesses;
@property(nonatomic,copy) NSString *desc;
@end
