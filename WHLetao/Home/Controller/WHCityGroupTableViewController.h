//
//  WHCityGroupTableViewController.h
//  WHLetao
//
//  Created by Wayne on 16/5/6.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHMetaDataTool.h"
typedef void(^CITY_BLOCK)(NSString* cityName);
@interface WHCityGroupTableViewController : UITableViewController

+(instancetype)cityGroupTableViewControllerDidChoice:(CITY_BLOCK) cityBlock;
@end
