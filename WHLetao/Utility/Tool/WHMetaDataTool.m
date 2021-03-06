//
//  WHMetaDataTool.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMetaDataTool.h"

@implementation WHMetaDataTool
+(NSArray *)parseDealsResult:(id)result{
    //1.获取deals对应的数组（NSDictionary）
    NSArray *dealArray = result[@"deals"];
    //2.循环NSDictionary->WHDeal
    NSMutableArray *mutaArr = [NSMutableArray array];
    for (NSDictionary* dealDic in dealArray) {
        WHDeal *deal = [[WHDeal alloc]init];
        
        [deal setValuesForKeysWithDictionary:dealDic];
        [mutaArr addObject:deal];
    }
    //3.返回
    return [mutaArr copy];
}
static NSArray *cityGroupsArray = nil;
+(NSArray*)getALLCityGroups{
    if (!cityGroupsArray) {
        cityGroupsArray = [[self alloc]getAndParseWithPlistFile:@"cityGroups.plist" withClass:[WHCityGroup class]];
    }
    return cityGroupsArray;
}
static NSArray *sortArray = nil;
+(NSArray *)getAllSorts{
    if (!sortArray) {
        sortArray = [[self alloc]getAndParseWithPlistFile:@"sorts.plist" withClass:[WHSort class]];
    }
    return sortArray;
}
static NSArray *cityArray = nil;
+(NSArray *)getALLCities{
    if (!cityArray) {
        cityArray = [[self alloc]getAndParseWithPlistFile:@"cities.plist" withClass:[WHCity class]];
    }
    return cityArray;
}
+(NSArray *)getAllRegionsByCityName:(NSString *)cityName{
    WHCity *findedCity;
    for (WHCity *city in [self getALLCities]) {
        if ([city.name isEqualToString:cityName]) {
            findedCity = city;
            break;
        }
    }
    return [WHMetaDataTool getModelArrayWithClass:[WHRegion class] withArray:findedCity.regions];
}
+(WHCategory *)getCategoryWithDeal:(WHDeal *)deal{
    NSArray *arr = deal.categories;
    
    WHCategory *retCategory;
    if (arr.count) {
        
        for (NSString *categoryName in arr) {
            
            NSArray *categories = [self getAllCategories];
            for (WHCategory *category in categories) {
                if ([category.name containsString:categoryName]||[categoryName containsString:category.name]) {
                    retCategory = category;
                }
            }
        }
    
    }else{
        return nil;
    }
    return retCategory;
}
static NSArray *categories = nil;
+(NSArray *)getAllCategories{
    if (!categories) {
        categories = [[self alloc]getAndParseWithPlistFile:@"categories.plist" withClass:[WHCategory class]];
    }
    return categories;
}
+(NSArray *)getAllBusiness:(WHDeal*)deal{
    return [self getModelArrayWithClass:[WHBusiness class] withArray:deal.businesses];
}
static NSArray *menuArray;
+(NSArray *)getAllMenues{
    if (!menuArray) {
        menuArray = [[self alloc]getAndParseWithPlistFile:@"menuData.plist" withClass:[WHMenuData class]];
    }
    return menuArray;
}
/**
 *  从数组中获取模型数组的封装
 *
 *  @param modelClass 模型类名
 *  @param array      含有模型字典的数组
 *
 *  @return 模型的数组
 */
+(NSArray*)getModelArrayWithClass:(Class)modelClass withArray:(NSArray*)array{
    NSMutableArray *mutaArr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        id instance = [modelClass new];
        [instance setValuesForKeysWithDictionary:dic];
        [mutaArr addObject:instance];
    }
    return [mutaArr copy];
}

/**
 *  从plist文件获取模型数组的封装
 *
 *  @param fileName   plist文件名
 *  @param modelClass 模型类名
 *
 *  @return 模型数组
 */
-(NSArray *)getAndParseWithPlistFile:(NSString*)fileName withClass:(Class)modelClass{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSArray *plistArr = [NSArray arrayWithContentsOfFile:plistPath];
    
    NSArray *arr = [WHMetaDataTool getModelArrayWithClass:modelClass withArray:plistArr];
    return [arr copy];
}
@end
