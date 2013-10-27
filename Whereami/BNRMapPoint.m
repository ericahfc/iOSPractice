//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Erica Fischer-Colbrie on 10/12/13.
//  Copyright (c) 2013 Erica Fischer-Colbrie. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate, title, subtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    self = [super init];
    if(self){
        coordinate = c;
        NSDateFormatter * format = [[NSDateFormatter alloc]init];
        [format setTimeStyle:NSDateFormatterNoStyle];
        [format setDateStyle:NSDateFormatterMediumStyle];
        NSDate * unformatted = [NSDate date];
        subtitle = [format stringFromDate:unformatted];
        
    }
    return self;
}

-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

@end
