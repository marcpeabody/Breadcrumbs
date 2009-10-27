//
//  BreadcrumbAnnotation.h
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/19/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
@interface BreadcrumbAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D _coordinate;
	NSString *_title;
	NSString *_subtitle;
	NSString *_mediaFilePath;
}
@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@property(nonatomic, copy) NSString *mediaFilePath;
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate mediaFilePath:(NSString *)mediaFilePath;
+(id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate mediaFilePath:(NSString *)mediaFilePath;
@end
