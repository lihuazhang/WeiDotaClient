//
//  ViewController.h
//  WeiDotaClient
//
//  Created by scilearn peng on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LoginViewController : UIViewController
{
    IBOutlet UIButton* loginButton;
    IBOutlet UIButton* createButton;
    IBOutlet UITextField* nameField;
    IBOutlet UITextField* passwordField;
}

@property (nonatomic, retain)	UIButton		*loginButton;
@property (nonatomic, retain)   UIButton        *createButton;
@property (nonatomic, retain)   UITextField      *nameField;
@property (nonatomic, retain)   UITextField      *passwordField;


- (IBAction)login: (id)sender;
- (IBAction)create:(id)sender;

@end
