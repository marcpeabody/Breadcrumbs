//
//  BreadcrumbsViewController.m
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "BreadcrumbsViewController.h"

@implementation BreadcrumbsViewController

@synthesize mapView = _mapView;
#define DOCSFOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

-(IBAction)OLDdropBreadCrumb:(id)sender{
	NSLog(@"dropped a crumb");
	BreadcrumbAnnotation *ann = [BreadcrumbAnnotation annotationWithCoordinate:_mapView.userLocation.coordinate];
	[self.mapView addAnnotation: ann];
}
- (IBAction) dropBreadCrumb:(id)sender {
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
		UIImagePickerController *picker;
		picker = [[UIImagePickerController alloc] init];
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		picker.allowsEditing = YES;
		picker.delegate = self;
		
		NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
		if ([sourceTypes containsObject:(NSString *)kUTTypeMovie ]){
			picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, (NSString *)kUTTypeImage, nil];
		}
		
		[self presentModalViewController:picker animated:YES];
		
	}else{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera Available" message:@"Requires a camera to take pictures" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	NSLog(@"view for annotation");
	if(annotation == mapView.userLocation) return nil;	

	NSLog(@"a real annotation");
	BreadcrumbAnnotation *crumbAnnotation = (BreadcrumbAnnotation *)annotation;
	MKPinAnnotationView *annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"breadcrumb"] autorelease];
	//MKAnnotationView *annView = [[[MKAnnotationView alloc] initWithAnnotation:crumbAnnotation reuseIdentifier:@"breadcrumb"] autorelease];
	[annView setCanShowCallout:YES];
	NSLog(@"media file path: %@", crumbAnnotation.mediaFilePath);
	UIImage *image = [UIImage imageWithContentsOfFile:crumbAnnotation.mediaFilePath];
	UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
	imageView.frame = CGRectMake(0, 0, 30, 30);
	[annView setRightCalloutAccessoryView:imageView];
	[annView setAnimatesDrop:YES];
	[annView setPinColor:MKPinAnnotationColorRed];
	//annView.image = [UIImage imageNamed:@"breadcrumbs.png"];
	return annView;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	int i=0;	
	NSString *uniquePath = [DOCSFOLDER stringByAppendingPathComponent:@"crumbblog.png"];
	while ([[NSFileManager defaultManager] fileExistsAtPath:uniquePath]){
		uniquePath = [NSString stringWithFormat:@"%@/%@-%d.png",DOCSFOLDER,@"crumbblog",++i];
	}
	UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
	[UIImagePNGRepresentation(image) writeToFile: uniquePath atomically:YES];
	
	BreadcrumbAnnotation *ann = [BreadcrumbAnnotation annotationWithCoordinate:_mapView.userLocation.coordinate mediaFilePath:uniquePath];
	[self.mapView addAnnotation: ann];
	
	[self dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[self dismissModalViewControllerAnimated:YES];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
