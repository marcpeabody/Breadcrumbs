//
//  BreadcrumbsViewController.h
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "BreadcrumbAnnotation.h"


@interface BreadcrumbsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate> {
	MKMapView *_mapView;
}
@property(nonatomic, retain)IBOutlet MKMapView *mapView;

-(IBAction)dropBreadCrumb:(id)sender;
@end

