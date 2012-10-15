//
//  RegistViewController.m
//  WeiDotaClient
//
//  Created by scilearn peng on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"
#import "HttpCom.h"
@interface RegistViewController ()

@end

@implementation RegistViewController

@synthesize createButton;
@synthesize nameField;
@synthesize passwordField;
@synthesize inviteCodeField;
@synthesize heroTypeControl;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    heroIconId = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)create:(id)sender
{
    //LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //[self.navigationController pushViewController:controller animated:YES];
    if ([nameField.text length] == 0)
    {
        
        //UIAlertView *alert=[[[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil] autorelease];
        //[alert show];
        return;
    }
    if ([passwordField.text length] == 0)
    {
        return;
    }
    
    NSLog(@"Regist: name = %@, password = %@, %d", nameField.text, passwordField.text, heroTypeControl.tag);
    NSString *urlString = [[NSString stringWithFormat:
                            @"%@/player_new.php?hero_name=%@&hero_pass=%@&hero_type=%d&hero_icon=%d",                   
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"ServerURL"], 
                            nameField.text, 
                            passwordField.text,
                            heroTypeControl.tag,
                            heroIconId]
        stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *reponse = [HttpCom sendHttpSycRequest:urlString];
    
    //LoginViewController *second= [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //[self presentModalViewController:second animated:YES];
    [self performSegueWithIdentifier:@"GotoLoginView" sender:self];
}

@end
