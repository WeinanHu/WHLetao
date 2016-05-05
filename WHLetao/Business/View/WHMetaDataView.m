//
//  WHMetaDataView.m
//  WHLetao
//
//  Created by Wayne on 16/5/5.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMetaDataView.h"

@implementation WHMetaDataView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)getMetaDataView{
    return [[[NSBundle mainBundle]loadNibNamed:@"WHMetaDataView" owner:self options:nil] lastObject];
}
@end
