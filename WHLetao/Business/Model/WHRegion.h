//
//  WHRegion.h
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHRegion : NSObject
/**主区域的名字*/
@property(nonatomic,strong) NSString *name;
/**主区域中所有子区域*/
@property(nonatomic,strong) NSArray *subregions;
@end
