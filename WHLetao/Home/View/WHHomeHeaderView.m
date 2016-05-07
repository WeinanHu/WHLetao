//
//  WHHomeHeaderView.m
//  WHLetao
//
//  Created by Wayne on 16/5/7.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHHomeHeaderView.h"
#import "WHControl.h"
#import "WHMetaDataTool.h"

@interface WHHomeHeaderView()
@property(nonatomic,strong) NSArray *menuDataArray;
@end
@implementation WHHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        UIScrollView *scroView = [[UIScrollView alloc]initWithFrame:frame];
        scroView.contentSize = CGSizeMake(screenWidth *2, screenWidth*0.5);
        scroView.showsHorizontalScrollIndicator = NO;
        UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth*0.5)];
        CGFloat quarterScreenWidth = screenWidth*0.25;
        for (int i = 0; i<8; i++) {
            CGRect controlFrame = CGRectMake(quarterScreenWidth*(i%4), quarterScreenWidth*(i/4), quarterScreenWidth, quarterScreenWidth);
            WHControl *control = [[NSBundle mainBundle]loadNibNamed:@"WHControl" owner:self options:nil].lastObject;
            control.frame = controlFrame;
            WHMenuData *menu = self.menuDataArray[i];
            control.imageView.image = [UIImage imageNamed:menu.image];
            control.label.text = menu.title;
            control.tag = 1000+i;
            [control addTarget:self action:@selector(clickControl:) forControlEvents:UIControlEventTouchUpInside];
            [firstView addSubview:control];
        }
        [scroView addSubview:firstView];
        
        UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(screenWidth, 0, screenWidth, screenWidth*0.5)];
        for (int i = 0; i<8; i++) {
            CGRect controlFrame = CGRectMake(quarterScreenWidth*(i%4), quarterScreenWidth*(i/4), quarterScreenWidth, quarterScreenWidth);
            WHControl *control = [[NSBundle mainBundle]loadNibNamed:@"WHControl" owner:self options:nil].lastObject;
            control.frame = controlFrame;
            WHMenuData *menu = self.menuDataArray[i+8];
            control.imageView.image = [UIImage imageNamed:menu.image];
            control.label.text = menu.title;
            control.tag = 1000+i+8;
            [control addTarget:self action:@selector(clickControl:) forControlEvents:UIControlEventTouchUpInside];
            [secondView addSubview:control];

        }
        [scroView addSubview:secondView];
        [self addSubview:scroView];
    }
    return self;
}
-(void)clickControl:(UIControl*)control{
    NSLog(@"选中第%ld个control",control.tag-1000);
    if ([self.delegate respondsToSelector:@selector(clickHomeControl:)]) {
        [self.delegate clickHomeControl:control.tag-1000];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSArray *)menuDataArray {
	if(_menuDataArray == nil) {
		_menuDataArray = [WHMetaDataTool getAllMenues];
	}
	return _menuDataArray;
}

@end
