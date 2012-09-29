//
//  NoticiasViewController.h
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticiasViewController : UIViewController{
    NSString *auxtitulo;
    NSString *auxsubtitulo;
}
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextView *texto;
@property (strong, nonatomic) IBOutlet UILabel *titulo;
@property NSString *auxtitulo;
@property NSString *auxsubtitulo;
@end
