//
//  Authenticated.h
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved.  
//

#import <Foundation/Foundation.h>


@interface Authenticated : NSObject {
	BOOL loggin;
}

@property (nonatomic) BOOL loggin;

- (BOOL)locally;
- (BOOL)remotly;

@end
