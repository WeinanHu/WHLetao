//
//  WHBusiness.h
//  WHLetao
//
//  Created by Wayne on 16/5/7.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHBusiness : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSNumber *id;
@property(nonatomic,copy) NSString *city;
@property(nonatomic,assign) float latitude;
@property(nonatomic,assign) float longitude;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *h5_url;
@end
