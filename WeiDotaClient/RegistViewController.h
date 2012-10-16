//
//  RegistViewController.h
//  WeiDotaClient
//
//  Created by scilearn peng on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController
{
    IBOutlet UIButton* createButton;
    IBOutlet UITextField *nameField;
    IBOutlet UITextField *passwordField;
    IBOutlet UITextField *inviteCodeField;
    IBOutlet UISegmentedControl *heroTypeControl;
}

@property (nonatomic, retain)   UIButton           *createButton;
@property (nonatomic, retain)   UITextField        *nameField;
@property (nonatomic, retain)   UITextField        *passwordField;
@property (nonatomic, retain)   UITextField        *inviteCodeField;

@property (nonatomic, retain)   UISegmentedControl *heroTypeControl;


- (IBAction)create:(id)sender;

@end
