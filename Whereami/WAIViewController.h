//
//  WAIViewController.h
//  Whereami
//
//  Created by Erica Fischer-Colbrie on 10/12/13.
//  Copyright (c) 2013 Erica Fischer-Colbrie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "BNRMapPoint.h"

@interface WAIViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    
}
-(void)findLocation;
-(void)foundLocation:(CLLocation*)loc;

@end
