//
//  WHHomeHeaderView.h
//  WHLetao
//
//  Created by Wayne on 16/5/7.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WHHomeHeaderViewDelegate<NSObject>
-(void)clickHomeControl:(long)tag;
@end
@interface WHHomeHeaderView : UIView
@property(nonatomic,weak) id<WHHomeHeaderViewDelegate> delegate;
@end
