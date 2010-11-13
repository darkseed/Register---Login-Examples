//
//  Validation.m
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved. 
//

#import "Validation.h"


@implementation Validation

- (BOOL)emailRegEx:(NSString *)string {
	
	// lowercase the email for proper validation
	string = [string lowercaseString];
	
	// regex for email validation
	NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	
	NSPredicate *regExPredicate =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
	BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
	
	return myStringMatchesRegEx;
	
}

- (BOOL)passwordMinLength:(NSInteger *)minLength password:(NSString *)string {
	return ((NSInteger *)[string length] < minLength) ? NO:YES;
}

@end
