//
//  WHAnnotation.h
//  WHLetao
//
//  Created by Wayne on 16/5/7.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface WHAnnotation : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;

// Title and subtitle for use by selection UI.
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

@property(nonatomic,strong,nullable) UIImage *image;
@end
