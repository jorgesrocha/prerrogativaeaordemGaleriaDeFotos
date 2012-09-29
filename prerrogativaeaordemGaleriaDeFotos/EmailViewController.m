//
//  EmailViewController.m
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "EmailViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface EmailViewController ()

@end

@implementation EmailViewController
@synthesize nomeTextField,emailTextField,textoTextView,botaoEnviarEmail;
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
    //Configuração das caractéristicas do uitextview
    textoTextView.layer.borderWidth=1.0f;
    textoTextView.layer.borderColor=[[UIColor grayColor] CGColor];
    textoTextView.layer.cornerRadius=5;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) sendEmailTo:(NSString *)to withSubject:(NSString *) subject withBody:(NSString *)body {
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body  stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}

- (IBAction)enviarEmail:(id)sender {
    NSString *email=emailTextField.text;
    NSString *nome=nomeTextField.text;
    NSString *texto=textoTextView.text;
    //Email = destinatário  ---> CONTATO@PRERROGATIVAEAORDEM.COM.BR
    NSString *destinatario=@"contato@prerrogativaeaordem.com.br";
    NSString *msg=[NSString stringWithFormat:@"%@\n*Nome:%@\n*Email:%@",texto,nome,email];
                   [self sendEmailTo:destinatario withSubject:@"Contato app" withBody:msg];
    
}
#pragma mark - Eventos com o teclado
- (IBAction)clicaNoBackground:(id)sender{
    [textoTextView resignFirstResponder];
    [nomeTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    
}

- (IBAction)clicaNoBotaoSend:(id)sender{
    [self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    //Verifique se o seu textField está com o teclado aberto e se o toque foi fora dele.
    if ([textoTextView isFirstResponder] && [touch view] != textoTextView) {
        [textoTextView resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
@end
