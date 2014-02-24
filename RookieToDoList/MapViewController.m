//
//  MapViewController.m
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/23/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController (){
    
    CLGeocoder *geocoder;
//    CLPlacemark *placemark;
    
}



@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    geocoder=[CLGeocoder new];
    if (self.placemark) {
        
        MKPointAnnotation *annotation=[[MKPointAnnotation alloc]init];
        annotation.coordinate=self.placemark.location.coordinate;
        [self.mapView removeAnnotations:self.mapView.annotations];
        [self.mapView addAnnotation:annotation];
        self.mapView.region=MKCoordinateRegionMake(self.placemark.location.coordinate, MKCoordinateSpanMake(0.2, 0.2));


    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPlacemark:(CLPlacemark *)placemark{
    
    _placemark=placemark;
    
    [self.mapView setRegion:MKCoordinateRegionMake(placemark.location.coordinate, MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
    
    MKPointAnnotation *annotation=[[MKPointAnnotation alloc]init];
    annotation.coordinate=self.placemark.location.coordinate;
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:annotation];
    self.mapView.region=MKCoordinateRegionMake(placemark.location.coordinate, MKCoordinateSpanMake(0.2, 0.2));
    
    
}

-(void)setShowOnly:(BOOL)showOnly{
    
    _showOnly=showOnly;
    self.navigationItem.rightBarButtonItem=nil;
    
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    
    mapView.region=MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.2, 0.2));
    
}

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (!error) {
            
            self.placemark=placemarks[0];
            
            
        }
        
    }];
    
    
}


- (IBAction)save:(UIBarButtonItem *)sender {
    
    self.saveBlock(self.placemark);
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
