//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Erica Fischer-Colbrie on 10/12/13.
//  Copyright (c) 2013 Erica Fischer-Colbrie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>{
    
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, readonly, copy)NSString *title;
@property(nonatomic, readonly, copy)NSString* subtitle;

@end
