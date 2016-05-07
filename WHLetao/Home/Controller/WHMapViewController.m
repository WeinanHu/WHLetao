//
//  WHMapViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/7.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHMapViewController.h"
#import <MapKit/MapKit.h>
#import "DPAPI.h"
#import "WHMetaDataTool.h"
#import "WHAnnotation.h"

@interface WHMapViewController ()<MKMapViewDelegate,DPRequestDelegate>
@property(nonatomic,strong) CLLocationManager *manager;
@property(nonatomic,strong) MKMapView *mapView;
@property(nonatomic,strong) CLGeocoder *geocoder;
@property(nonatomic,strong) NSString *cityName;
@end

@implementation WHMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    self.manager = [CLLocationManager new];
    self.mapView.delegate = self;
    //征求同意
    [self.manager requestWhenInUseAuthorization];
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.geocoder = [[CLGeocoder alloc]init];
    [self.view addSubview:self.mapView];
    // Do any additional setup after loading the view.
}
#pragma mark - mapViewDelegate
//时机一：设置参数，发送请求
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            CLPlacemark *placemark = placemarks.lastObject;
            NSString *cityName = placemark.addressDictionary[@"City"];
            self.cityName = [cityName substringToIndex:(cityName.length-1)];
        }
    }];
}
//时机二：设置参数，发送请求
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    //地图区域拖拽停止后
    DPAPI *api = [[DPAPI alloc]init];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (self.cityName == nil) {
        return;
    }
    param[@"city"] = self.cityName;
    param[@"latitude"] = @(mapView.region.center.latitude);
    param[@"longitude"] = @(mapView.region.center.longitude);
    param[@"radius"] = @500;
    NSLog(@"请求的参数是：%@",param);
    [api requestWithURL:@"v1/deal/find_deals" params:param delegate:self];
}

#pragma mark - DP delegate 
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    NSArray *allDealsArray = [WHMetaDataTool parseDealsResult:result];//deal模型对象
    for(WHDeal *deal in allDealsArray){
        //给定模型对象，返回所有商家数组（WHBusiness类型）
        NSArray *businessArray = [WHMetaDataTool getAllBusiness:deal];
//        NSArray *category = [WHMetaDataTool getCategoryWithDeal:deal];
        WHCategory *category = [WHMetaDataTool getCategoryWithDeal:deal];
        //每个店家对应一个大头针对象
        for (WHBusiness *business in businessArray) {
            //创建大头针对象（自定义图片）
            WHAnnotation *annotation = [WHAnnotation new];
            annotation.coordinate = CLLocationCoordinate2DMake(business.latitude, business.longitude);
            annotation.title = business.name;
            annotation.subtitle = deal.desc;
            NSArray *annotationArr = self.mapView.annotations;
            
            for (id<MKAnnotation> ano in annotationArr) {
                if ([ano.title isEqualToString:annotation.title]) {
                    return;
                }
            }
            if (category.icon) {
                annotation.image = [UIImage imageNamed:category.map_icon];
            }else{
                annotation.image = [UIImage imageNamed:@"ic_category_20"];
            }
            //添加到地图上
            [self.mapView addAnnotation:annotation];
        }
    }
    //            NSLog(@"%@",[NSThread mainThread]);
    
    
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString *identifier = @"annotation";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!view) {
        view =[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        view.canShowCallout = YES;
        WHAnnotation *anno = (WHAnnotation*)annotation;
        view.image = anno.image;
        
    }else{
        view.annotation = annotation;
    }
    return view;
}
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
