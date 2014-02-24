//
//  MapViewController.h
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/23/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController<MKMapViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (copy,nonatomic)  void (^saveBlock)(CLPlacemark *);
@property (strong,nonatomic)CLPlacemark *placemark;
@property (assign,nonatomic)BOOL showOnly;

- (IBAction)save:(UIBarButtonItem *)sender;

@end
