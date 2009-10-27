//
//  BreadcrumbsAppDelegate.h
//  Breadcrumbs
//
//  Created by Marc Peabody on 9/18/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BreadcrumbsViewController;

@interface BreadcrumbsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BreadcrumbsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BreadcrumbsViewController *viewController;

@end

