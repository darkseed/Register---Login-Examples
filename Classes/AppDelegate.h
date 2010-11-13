//
//  AppDelegate.h
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved. 
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

