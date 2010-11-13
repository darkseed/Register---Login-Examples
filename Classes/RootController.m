//
//  RootController.m
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved. 
//

#import "RootController.h"
#import "AppDelegate.h"
#import "Authenticated.h"
#import "RegisterController.h"
#import "LogInController.h"

@implementation RootController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	self.title = @"Welcome";
	
}

- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	// do we have a valid authentication?
	Authenticated *authed = [[Authenticated alloc] init];
	
	if (![authed locally]){
		[self configureToolbarItems];
	}
	
	[authed release];
	
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

#pragma mark -
#pragma mark Button Clicks

- (void)loginClicked:(id)sender{
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	LogInController *logInController = [[LogInController alloc] init];
	
	[delegate.navigationController pushViewController:logInController animated:YES];
	[logInController release];	
}

- (void)registerClicked:(id)sender{
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	RegisterController *registerController = [[RegisterController alloc] init];
	
	[delegate.navigationController pushViewController:registerController animated:YES];
	[registerController release];
}

#pragma mark -
#pragma mark Tool Bar

- (void)configureToolbarItems {
	UIBarButtonItem *loginButtonItem = [[UIBarButtonItem alloc]
										initWithTitle:@"Sign in"
										style:UIBarButtonItemStyleBordered  
										target:self action:@selector(loginClicked:)];
	
	UIBarButtonItem *registerButtonItem = [[UIBarButtonItem alloc]
										   initWithTitle:@"Register"
										   style:UIBarButtonItemStyleBordered  
										   target:self action:@selector(registerClicked:)];
	
	UIBarButtonItem *flexSpaceButtonItem = [[UIBarButtonItem alloc]
											initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
											target:nil action:nil];
	
	
	self.toolbarItems = [NSArray arrayWithObjects:
						 flexSpaceButtonItem,
						 loginButtonItem,
						 registerButtonItem,
						 flexSpaceButtonItem,
                         nil];
	
	[self.navigationController setToolbarHidden:NO];
	
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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
    [super dealloc];
}


@end

