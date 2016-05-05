//
//  WHCategory.h
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHCategory : NSObject
@property(nonatomic,copy) NSString *highlighted_icon;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *small_highlighted_icon;
@property(nonatomic,copy) NSString *small_icon;
@property(nonatomic,copy) NSString *map_icon;
@property(nonatomic,copy) NSArray *subcategories;
@end
