//
//  WHDeal.m
//  WHLetao
//
//  Created by Wayne on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHDeal.h"

@implementation WHDeal
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        //key:字典的对应key;value:字典对应值
        self.desc = value;
    }
}
@end
