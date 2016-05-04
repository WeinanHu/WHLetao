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
static NSArray *sortArray = nil;
+(NSArray *)getAllSorts{
    if (!sortArray) {
        sortArray = [[self alloc]getAndParseWithPlistFile:@"sorts.plist" withClass:[WHSort class]];
    }
    return sortArray;
}

-(NSArray *)getAndParseWithPlistFile:(NSString*)fileName withClass:(Class)modelClass{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSArray *plistArr = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *mutaArr = [NSMutableArray array];
    for (NSDictionary *dic in plistArr) {
        id instance = [modelClass new];
        [instance setValuesForKeysWithDictionary:dic];
        [mutaArr addObject:instance];
    }
    return [mutaArr copy];
}
@end
