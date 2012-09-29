//
//  VideosTableViewController.h
//  Feed[test]
//
//  Created by Jorginho on 27/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSItens.h"
@interface VideosTableViewController : UITableViewController{
    NSArray *_objetos;
    NSURL *feedUrl;
    UIRefreshControl *refreshControl;
    RSSItens *_objetosItens;
    
}


@property NSArray *_objetos;
@property NSURL *feedUrl;
@property RSSItens *_objetosItens;
-(void) configuraFeed;


@end
