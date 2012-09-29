//
//  VideoViewController.m
//  Feed[test]
//
//  Created by Jorginho on 27/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "VideoViewController.h"
#import "RSSItens.h"  

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize webView,auxLink;
@synthesize url,request;

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
    //Carrega URL
    //Recebe URL com sucesso!
    NSLog(@"URL RECEBIDA(NSString)-->%@",auxLink);
    NSLog(@"\nURL RECEBIDA(NSURL)-->%@",url);
    request=[NSURLRequest requestWithURL:url];
     NSLog(@"URL convertida com sucesso!");//Converte a URL em uma requisição
    [webView loadRequest:request];
    [webView setDelegate:self];

    self.title=@"Vídeo";
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        

    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication]
     setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication]
     setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:
(NSError *)error {
    [[UIApplication sharedApplication]
     setNetworkActivityIndicatorVisible:NO];
}


@end
