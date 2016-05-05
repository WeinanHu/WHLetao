//
//  WHMetaDataTool.h
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHDeal.h"
#import "WHSort.h"
#import "WHCity.h"
#import "WHRegion.h"
#import "WHCategory.h"
@interface WHMetaDataTool : NSObject
//给定服务器返回的result数据（字典），返回所有订单模型对象组成的数组（TRDeal）
+(NSArray*)parseDealsResult:(id)result;
+(NSArray*)getAllSorts;
+(NSArray*)getALLCities;
+(NSArray*)getAllRegionsByCityName:(NSString*)cityName;
+(NSArray *)getAllCategories;
@end
