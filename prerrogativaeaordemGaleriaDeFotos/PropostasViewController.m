//
//  PropostasViewController.m
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "PropostasViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface PropostasViewController ()

@end

@implementation PropostasViewController
@synthesize textView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Propostas";
    textView.layer.borderWidth=1.0f;
    textView.layer.borderColor=[[UIColor grayColor] CGColor];
    textView.layer.cornerRadius=5;
    

    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar"];
        
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
