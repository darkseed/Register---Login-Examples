//
//  RegisterController.m
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved.
//

#import "RegisterController.h"
#import "AppDelegate.h"
#import "LogInController.h"
#import "Validation.h"

@implementation RegisterController
@synthesize emailTextField, passwordTextField, emailCell, passwordCell, registerButton, signInButton;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	
	self.title = @"Register";
	
	[self.emailTextField setDelegate:self];
    [self.emailTextField setReturnKeyType:UIReturnKeyNext];
	[self.emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
	[self.emailTextField addTarget:self
							action:@selector(emailFieldFinished:)
							forControlEvents:UIControlEventEditingDidEndOnExit];
	
	[self.passwordTextField setDelegate:self];
    [self.passwordTextField setReturnKeyType:UIReturnKeyGo];
	[self.passwordTextField setKeyboardType:UIKeyboardTypeDefault];
	[self.passwordTextField addTarget:self
							action:@selector(passwordFieldFinished:)
							forControlEvents:UIControlEventEditingDidEndOnExit];
	
	
}

- (void)viewWillAppear:(BOOL)animated {
	[emailTextField becomeFirstResponder];
    [super viewWillAppear:animated];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Text Field & Button Events and Triggers

- (BOOL)emailFieldFinished:(id)sender {
	[passwordTextField becomeFirstResponder];
	return NO;
}
- (BOOL)passwordFieldFinished:(id)sender {
	[self registerButtonClick:sender];
	return NO;
}

- (IBAction)signInButtonClick:(id)sender {
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	LogInController *logInController = [[LogInController alloc] init];
	
	[delegate.navigationController pushViewController:logInController animated:YES];
	[logInController release];	
}

- (IBAction)registerButtonClick:(id)sender {
	
	// get the field values
	UITextField *emailEntry = (UITextField *)[emailCell viewWithTag:777];
	UITextField *passwordEntry = (UITextField *)[passwordCell viewWithTag:778];
	
	// init the validation class
	Validation *validate = [[Validation alloc] init];
	
	// validate email and pop alert if need be
	BOOL emailValid = [validate emailRegEx:emailEntry.text];
	
	if (!emailValid) {
		
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Invalid Email" 
							  message:@"Your email address is not valid. Please try again." 
							  delegate:self 
							  cancelButtonTitle:nil 
							  otherButtonTitles:@"Okay",
							  nil];
		[alert show];
		[alert autorelease];
		[emailTextField becomeFirstResponder];
		
	}
	
	// validate password and pop alert if need be
	BOOL passwordValid = [validate passwordMinLength:(NSInteger *)6 password:passwordEntry.text];
	
	if (!passwordValid && emailValid) {
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Invalid Password" 
							  message:@"Your password must be at least 6 characters long. Please try again." 
							  delegate:self 
							  cancelButtonTitle:nil 
							  otherButtonTitles:@"Okay",
							  nil];
		[alert show];
		[alert autorelease];
		[passwordTextField becomeFirstResponder];
	}
	
	NSLog(@"emailEntry: %@",emailEntry.text);
	NSLog(@"passwordEntry: %@",passwordEntry.text);
	
}

#pragma mark -
#pragma mark Table View Delegate
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = nil;
	
	if( indexPath.row == 0 ){
		cell = emailCell;
	}else{
		cell = passwordCell;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
	return 2;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[tableView release];
	[passwordTextField release];
	[emailTextField release];
	[emailCell release];
	[passwordCell release];
	[registerButton release];
	[signInButton release];
    [super dealloc];
}


@end

