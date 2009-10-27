//
//  BreadcrumbAnnotation.m
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BreadcrumbAnnotation.h"


@implementation BreadcrumbAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize mediaFilePath = _mediaFilePath;

+(id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate mediaFilePath:(NSString *)mediaFilePath{
	return [[[[self class] alloc] initWithCoordinate:coordinate mediaFilePath:mediaFilePath] autorelease];
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate mediaFilePath:(NSString *)mediaFilePath{
	self = [super init];
	if(self != nil){
		self.coordinate = coordinate;
		NSDate *date = [NSDate date];
		NSDateFormatter *date_formater = [[[NSDateFormatter alloc]init] autorelease];
		[date_formater setDateFormat:@"MM/dd/YYYY"];
		self.title = [date_formater stringFromDate:date];
		[date_formater setDateFormat:@"HH:mm:ss"];
		self.subtitle = [date_formater stringFromDate:date];
		self.mediaFilePath = mediaFilePath;
	}
	return self;
}

+(id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate{
	return [[[[self class] alloc] initWithCoordinate:coordinate] autorelease];
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate{
	self = [super init];
	if(self != nil){
		self.coordinate = coordinate;
		NSDate *date = [NSDate date];
		NSDateFormatter *date_formater = [[[NSDateFormatter alloc]init] autorelease];
		[date_formater setDateFormat:@"MM/dd/YYYY"];
		self.title = [date_formater stringFromDate:date];
		[date_formater setDateFormat:@"HH:mm:ss"];
		self.subtitle = [date_formater stringFromDate:date];
	}
	return self;
}


@end
