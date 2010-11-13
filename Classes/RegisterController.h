//
//  RegisterController.h
//
//  Created by Chris Dritsas - ChrisDrit@gmail.com  
//  Copyright 2010. All rights reserved. 
//

#import <UIKit/UIKit.h>

@interface RegisterController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate> {
	IBOutlet UITableView *tableView;
	IBOutlet UITextField *emailTextField;
	IBOutlet UITextField *passwordTextField;
	IBOutlet UITableViewCell *emailCell;
	IBOutlet UITableViewCell *passwordCell;
	IBOutlet UIButton *registerButton;
	IBOutlet UIButton *signInButton;
}

@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;
@property (nonatomic, retain) IBOutlet UITableViewCell *emailCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *passwordCell;
@property (nonatomic, retain) IBOutlet UIButton *registerButton;
@property (nonatomic, retain) IBOutlet UIButton *signInButton;

- (IBAction)registerButtonClick:(id)sender;
- (IBAction)signInButtonClick:(id)sender;
- (BOOL)emailFieldFinished:(id)sender;
- (BOOL)passwordFieldFinished:(id)sender;

@end
