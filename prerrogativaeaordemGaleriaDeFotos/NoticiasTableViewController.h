//
//  NoticiasTableViewController.h
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticiasTableViewController : UITableViewController{
    NSArray *_objetos;
    NSURL *feedUrl;
    UIRefreshControl *refreshControl;
}


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicadorDeAtividade;
@property NSArray *_objetos,*_textos;
@property NSURL *feedUrl;



@end
