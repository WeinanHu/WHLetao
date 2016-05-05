//
//  WHMetaDataView.h
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHMetaDataView : UIView
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
+(instancetype)getMetaDataView;
@end
