//
//  WAIViewController.m
//  Whereami
//
//  Created by Erica Fischer-Colbrie on 10/12/13.
//  Copyright (c) 2013 Erica Fischer-Colbrie. All rights reserved.
//

#import "WAIViewController.h"
#import "BNRMapPoint.h"


@implementation WAIViewController

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}
    
-(void)findLocation{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}
-(void)foundLocation:(CLLocation*)loc{
    CLLocationCoordinate2D coord = [loc coordinate];
    BNRMapPoint *map = [[BNRMapPoint alloc]initWithCoordinate:coord
                                                       title:[locationTitleField text]];
    
    
    [worldView addAnnotation:map];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 10, 10);
    
    [worldView setRegion:region animated:YES];
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 10, 10);
    [worldView setRegion:region animated:YES];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
    }
    return self;
}
-(void)viewDidLoad{
    [worldView setShowsUserLocation:YES];
}

-(void)locationManager:(CLLocationManager*)manager
didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    NSLog(@"%@", newLocation);
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    if(t<-180){
        return;
    }
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager*)manager
      didFailWithError:(NSError *)error{
    NSLog(@"Could not find locaiton: %@", error);
}

-(void)dealloc{
    [locationManager setDelegate:nil];
}

@end
