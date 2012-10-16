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
#import "UIDevice-Extensions.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

@synthesize createButton;
@synthesize nameField;
@synthesize passwordField;
@synthesize inviteCodeField;
@synthesize heroTypeControl;
@synthesize iconImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    iconChooseView = nil;
    heroIconPath = nil;
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

- (void)finishChooseIcon:(UIButton*)btn
{
    NSLog(@"finish choose icon:%@", btn.titleLabel.text);
    
    heroIconPath = [NSMutableString stringWithString:btn.titleLabel.text];
    [iconImage setImage:[UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], heroIconPath]]];
    [UIView beginAnimations:@"flipping view"
                    context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.view
                             cache:NO];
    [iconChooseView removeFromSuperview];
    [UIView commitAnimations];
    [iconChooseView release];
    iconChooseView = nil;
    
}

- (IBAction)iconChoose:(id)sender
{
    
    iconChooseView = [[UIScrollView alloc]
               initWithFrame:self.view.bounds];
    iconChooseView.backgroundColor=[UIColor blackColor];
    // add image to the icon choose view
    NSString *path = [NSString stringWithFormat:@"%@/heros", [[NSBundle mainBundle] bundlePath], ""];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:path error:nil];
    int x = 0, y = 0;
    CGRect rect = iconChooseView.bounds;
    int width = rect.size.width;
    int height = rect.size.height;
    for (NSString *s in fileList)
    {
        NSLog(@"%@", s);
        //UIImage *image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"heros/%@", s]];
        //UIImageView * imageView =[[UIImageView alloc] initWithImage:image];
        //imageView.frame = CGRectMake(x, y, 64, 64);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:[NSString stringWithFormat:@"heros/%@", s] forState:UIControlStateNormal];
        btn.frame = CGRectMake(x,y,64,64); //edit for you own frame
        UIImage *img = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", path, s]];
        [btn setImage:img forState:UIControlStateNormal];
        x += 64;
        if (x+64>width)
        {
            x = 0;
            y += 64;
        }
        [btn addTarget:self action:@selector(finishChooseIcon:)
            forControlEvents:UIControlEventTouchUpInside];
        [iconChooseView addSubview:btn];
    }
    if (y+64 > height)
    {
        [iconChooseView setContentSize:CGSizeMake(width, y)];
    }
    // show view
    // add animation
    [UIView beginAnimations:@"flipping view"
                    context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:self.view
                             cache:NO];
    [self.view addSubview:iconChooseView];
    [UIView commitAnimations];

}

- (IBAction)create:(id)sender
{
    //LoginViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //[self.navigationController pushViewController:controller animated:YES];
    if ([nameField.text length] == 0)
    {
        UIAlertView *alert=[[[UIAlertView alloc] 
                             initWithTitle:NSLocalizedString(@"InputErrorTitle", nil)
                             message:NSLocalizedString(@"InputErrorInfoHeroName", nil)
                             delegate:self 
                             cancelButtonTitle:NSLocalizedString(@"InputErrorButton", nil)
                             otherButtonTitles:nil] 
                            autorelease];
        [alert show];
        return;
    }
    if ([passwordField.text length] == 0)
    {
        UIAlertView *alert=[[[UIAlertView alloc] 
                             initWithTitle:NSLocalizedString(@"InputErrorTitle", nil)
                             message:NSLocalizedString(@"InputErrorInfoPassword", nil)
                             delegate:self 
                             cancelButtonTitle:NSLocalizedString(@"InputErrorButton", nil)
                             otherButtonTitles:nil] 
                            autorelease];
        [alert show];
        return;
    }
    if (heroIconPath == nil)
    {
        UIAlertView *alert=[[[UIAlertView alloc] 
                             initWithTitle:NSLocalizedString(@"InputErrorTitle", nil)
                             message:NSLocalizedString(@"InputErrorInfoHeroIcon", nil)
                             delegate:self 
                             cancelButtonTitle:NSLocalizedString(@"InputErrorButton", nil)
                             otherButtonTitles:nil] 
                            autorelease];
        [alert show];
        return;
    }
    
    UIDevice* device = [[UIDevice alloc] init];
    NSString *imei = [device imei];
    if ( imei == nil)
    {
        imei = @"1235644";
    }
    [device release];
    NSString *heroIcon = @"heros/BTNSorceress.png";
    NSString *urlString = [[NSString stringWithFormat:
                            @"%@/player_new.php?hero_name=%@&hero_pass=%@&hero_type=%d&hero_icon=%@&v=%@&imei=%@",                   
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"ServerURL"], 
                            nameField.text, 
                            passwordField.text,
                            heroTypeControl.tag + 1,
                            heroIcon,
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
                            imei]
                        stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *response = [HttpCom sendHttpSycRequest:urlString];
    
    //LoginViewController *second= [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //[self presentModalViewController:second animated:YES];
    [self performSegueWithIdentifier:@"GotoLoginView" sender:self];
}



@end
