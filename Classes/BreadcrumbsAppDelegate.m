//
//  BreadcrumbsAppDelegate.m
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "BreadcrumbsAppDelegate.h"
#import "BreadcrumbsViewController.h"

@implementation BreadcrumbsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
