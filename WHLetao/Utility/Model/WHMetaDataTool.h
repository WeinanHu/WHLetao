//
//  WHMetaDataTool.h
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHMetaDataTool : NSObject
//给定服务器返回的result数据（字典），返回所有订单模型对象组成的数组（TRDeal）
+(NSArray*)parseDealsResult:(id)result;
@end
