//
//  FotosViewController.m
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "FotosViewController.h"

#import "TFHpple.h"
#import "Html.h"
#import "Colaborador.h"

@interface FotosViewController ()

@end

@implementation FotosViewController

@synthesize _bibliotecaPrincipal,_bibliotecaDeImagens;
//@synthesize pageControl,scrollView;
//@synthesize imageView1,imageView2;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
        _bibliotecaPrincipal=[[NSMutableArray alloc] init];
        _bibliotecaDeImagens=[[NSMutableArray alloc] init];

        [self carrgaListaDeLinks];
        [self carregaImagensDaUrlRecebida];



	// Do any additional setup after loading the view, typically from a nib.

    //Carrega URL
    //Recebe URL com sucesso!
    //NSLog(@"URL convertida com sucesso!");//Converte a URL em uma requisição
    
        //[webView loadRequest:request];
        //[webView setDelegate:self];
    
    self.title=@"Galeria de fotos";
  

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

#pragma mark - Recebe link das imagens do site

-(void)carrgaListaDeLinks{
   //1
    NSURL *urlPrerrogativa=[NSURL URLWithString:@"http://prerrogativaeaordem.com.br"];
    NSData *dadosDoHTML=[NSData dataWithContentsOfURL:urlPrerrogativa];
    
   //2
    TFHpple *conversorDeTags=[TFHpple hppleWithHTMLData:dadosDoHTML];
    
   //3
    NSString *XPathQueryString=@"//div[@class='envolve-galeria']/ul/li/a";
    NSArray *lacoHTML=[conversorDeTags searchWithXPathQuery:XPathQueryString];
    
    //4
    NSMutableArray *biblioteca=[[NSMutableArray alloc] initWithCapacity:0];
    
    for(TFHppleElement *element in lacoHTML ){
        Html *caracteristicasHTML=[[Html alloc] init];
        //5
        [biblioteca addObject:caracteristicasHTML];
        
        //6
        //caracteristicasHTML.titulo=[[element firstChild] content];
        
        //7
        caracteristicasHTML.url=[element objectForKey:@"href"];
        //NSLog(@"TITULO:%@",caracteristicasHTML.titulo);
    }

    _bibliotecaPrincipal=biblioteca;
}

-(void)carregaImagensDaUrlRecebida{
    for (int i=0; i<_bibliotecaPrincipal.count; i++) {
        NSString *site=(NSString *)[[_bibliotecaPrincipal objectAtIndex:i] url];
        NSString *caminho=[[NSString alloc] initWithFormat:@"http://www.prerrogativaeaordem.com.br/%@",site];
        NSLog(@"[%i]%@",i,caminho);
            NSURL *endereco= [NSURL URLWithString:caminho];
                NSData *data = [NSData dataWithContentsOfURL:endereco];
                    //UIImage *img= [[UIImage alloc] initWithData:data];
                    [_bibliotecaDeImagens addObject:data];
    }

    
    /*Testes
    UIImage *img1= [[UIImage alloc] initWithData:[_bibliotecaDeImagens objectAtIndex:0]];
    UIImage *img2= [[UIImage alloc] initWithData:[_bibliotecaDeImagens objectAtIndex:1]];
    [imageView1 setImage:img1];
    [imageView2 setImage:img2];
    */
    [self carregaImagensDaView];
}

-(void)carregaImagensDaView{
    /*
    for (int i=0; i<_bibliotecaDeImagens.count; i++) {
        NSData *dataFoto=[[NSData alloc ] initWithData:[_bibliotecaDeImagens objectAtIndex:i]];
        UIImage *foto=[[UIImage alloc] initWithData:dataFoto];
            UIImageView *imgView=[[UIImageView alloc] initWithImage:foto];
            //imgView.frame=CGRectMake((i-1)*320, 0, 320, 460);
                [scrollView addSubview:imgView];
                //[scrollView addSubview:imgView];
                  //  scrollView.pagingEnabled=YES;
            
                }
     
    //scrollView.contentSize=CGSizeMake(320*6, 460);
     */
}
@end
