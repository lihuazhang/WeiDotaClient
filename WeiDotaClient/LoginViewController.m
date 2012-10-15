//
//  LoginViewController.m
//  WeiDotaClient
//
//  Created by scilearn peng on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "HttpCom.h"

@implementation LoginViewController

@synthesize loginButton;
@synthesize createButton;
@synthesize nameField;
@synthesize passwordField;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)login: (id) sender
{
    if ([nameField.text length] == 0)
    {
        return;
    }
    NSLog(@"Login: name = %@, password: %@", nameField.text, passwordField.text);

    // send http request by get
    // use NSUTF8StringEncoding 
    NSString *urlString = [[NSString stringWithFormat:@"%@/player_get_pid.php?hero_name=%@&hero_pass=%@", 
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"ServerURL"],
                            nameField.text, 
                            passwordField.text]
                           stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];  
    NSString * response = [HttpCom sendHttpSycRequest:urlString];
}


- (IBAction)create:(id)sender
{
    NSLog(@"Create");
}


@end
