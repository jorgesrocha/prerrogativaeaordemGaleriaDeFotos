//
//  BiografiaViewController.m
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "BiografiaViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface BiografiaViewController ()

@end

@implementation BiografiaViewController
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
    textView.layer.borderWidth=1.0f;
    textView.layer.borderColor=[[UIColor grayColor] CGColor];
    textView.layer.cornerRadius=5;

	// Do any additional setup after loading the view.
    self.title = @"Biografia";
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar.png"];
        
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
