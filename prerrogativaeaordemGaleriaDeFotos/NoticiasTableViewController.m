//
//  NoticiasTableViewController.m
//  Feed[test]
//
//  Created by Jorginho on 26/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "NoticiasTableViewController.h"
#import "NoticiasViewController.h"

#import "RSSItens.h"
#import "RSSLoader.h"

#import "NoticiasCell.h"
#import "InfoNoticias.h"

@interface NoticiasTableViewController ()

@end

@implementation NoticiasTableViewController

@synthesize _objetos,feedUrl,refreshControl,_textos,indicadorDeAtividade;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    indicadorDeAtividade.hidden=YES;
    [super viewDidLoad];
    _objetos=[[NSMutableArray alloc] init];
    _textos=[[NSMutableArray alloc] init];
    

    self.title=@"Notícias";
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar"];
        
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
     //Configuração do FEED
    [self configuraFeed];
    //indicadorDeAtividade.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _objetos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NoticiasCell";
    
    NoticiasCell *celulaNoticia = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (celulaNoticia == nil) {
        celulaNoticia=[[NoticiasCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    InfoNoticias *galeriaDeNoticias=[[InfoNoticias alloc] init];
    
        galeriaDeNoticias.titulo=(NSString *)[[_objetos objectAtIndex:indexPath.row] titulo];
        galeriaDeNoticias.texto=[[_objetos objectAtIndex:indexPath.row] subtitulo];
    
    celulaNoticia.labelTitulo.text=[galeriaDeNoticias titulo];
    
    return celulaNoticia;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    //Seta a UIView <noticiaDetalhada>
    NoticiasViewController  *noticiaDetalhada=[storyBoard instantiateViewControllerWithIdentifier:@"NoticiaViewController"];
    
    noticiaDetalhada.auxsubtitulo=[[_objetos objectAtIndex:indexPath.row] subtitulo];
    noticiaDetalhada.auxtitulo=(NSString *)[[_objetos objectAtIndex:indexPath.row] titulo];
    [self.navigationController pushViewController:noticiaDetalhada animated:YES];
}



#pragma mark - configuracoes do feed
-(void)refreshFeed{
    
    RSSLoader *rss=[[RSSLoader alloc] init];
    
    [rss fetchRssWithURL:feedUrl complete:^(NSString *title, NSArray *results) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Envia os dados Recebidos pelo XML(results) para o NSMUtableArray itensGaleria
            _objetos= results;
            [self.tableView reloadData];
            
            [refreshControl endRefreshing];
            
        });
    }];
    
    
}



-(void)configuraFeed{
    //indicadorDeAtividade.hidden=NO;
    feedUrl= [NSURL URLWithString:@"http://prerrogativaeaordem.com.br/rss/noticias"];
    //feedUrl=[NSURL URLWithString:@"http://prerrogativaeaordem.com.br/rss/noticias"];

    //Configuração de atualização do FEED a partir do usuário
    refreshControl=[[UIRefreshControl alloc] init];

    
    [refreshControl addTarget:self action:@selector(refreshInvoked:forState:) forControlEvents:UIControlEventValueChanged];

    
    NSString *msgAtualizacao=[NSString stringWithFormat:@"Easy.com.vc"];

    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:msgAtualizacao
                                                                     attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:11.0]}];

    //Adicionando o refreshControl ao tableView
    
    [self.tableView addSubview:refreshControl];

    //Refresh do tableView
    [self refreshFeed];

}

-(void) refreshInvoked:(id)sender forState:(UIControlState)state{
    [self refreshFeed];
}
@end
