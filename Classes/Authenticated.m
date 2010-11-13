//
//  Authenticated.m
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved.  
//

#import "Authenticated.h"


@implementation Authenticated
@synthesize loggin;

- (id)init {
	
	// temp override
	self.loggin = NO;
	
	// check the database to see if we are logged in
	
	// if we are not logged in remotely, we will be notified
	// of this when we attempt to fetch data from server...
	
	return self;
}

- (BOOL)locally {
	return self.loggin;
}

- (BOOL)remotly {
	return self.loggin;
}

@end
