//
//  VideoViewController.h
//  Feed[test]
//
//  Created by Jorginho on 27/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *auxLink;
@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSURL *url;

@end
