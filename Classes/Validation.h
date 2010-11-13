//
//  Validation.h
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com 
//  Copyright 2010. All rights reserved. 
//

#import <Foundation/Foundation.h>


@interface Validation : NSObject {

}

- (BOOL)emailRegEx:(NSString *)string;
- (BOOL)passwordMinLength:(NSInteger *)length password:(NSString *)string;

@end
