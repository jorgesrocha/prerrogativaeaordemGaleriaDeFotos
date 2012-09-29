//
//  EmailViewController.h
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EmailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nomeTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextView *textoTextView;
@property (strong, nonatomic) IBOutlet UIButton *botaoEnviarEmail;

- (IBAction)enviarEmail:(id)sender;
- (IBAction)clicaNoBackground:(id)sender;
- (IBAction)clicaNoBotaoSend:(id)sender;

@end
