//
//  VideosTableViewController.m
//  Feed[test]
//
//  Created by Jorginho on 27/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "VideosTableViewController.h"
#import "RSSLoader.h"
#import "VideoViewController.h"
#import "VideoCell.h"
#import "Video.h"
#import "VideoViewController.h"
@interface VideosTableViewController ()

@end

@implementation VideosTableViewController
@synthesize  _objetos,feedUrl,_objetosItens;
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
    [super viewDidLoad];
    _objetos=[[NSMutableArray alloc] init];
    
    
    
    self.title=@"Vídeos";
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@""];
    
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
        UIImage *image = [UIImage imageNamed:@"bgnavigationbar"];
        
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    
    //Configuração do FEED
    [self configuraFeed];


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
    static NSString *CellIdentifier = @"videoCell"; //Declara a identificaação da célula custom
    
    VideoCell *celulaVideo = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    
    if (celulaVideo == nil) {
        celulaVideo=[[VideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Video  *galeriaDeVideos=[[Video alloc] init]; //Abstrata
    
        galeriaDeVideos.titulo=(NSString *)[[_objetos objectAtIndex:indexPath.row] titulo];
    
            celulaVideo.labelVideoCell.text=galeriaDeVideos.titulo; //Título do vídeo
    
    return celulaVideo;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

      VideoViewController  *videoController=[storyBoard instantiateViewControllerWithIdentifier:@"videoWeb"];
    
    //Recebe a URL do vídeo
    _objetosItens=_objetos[indexPath.row];
    

    videoController.auxLink=(NSString *)_objetosItens.link;
    videoController.url=[[_objetos objectAtIndex:indexPath.row] link];
    
     [self.navigationController pushViewController:videoController animated:YES];
     
}
-(void) refreshInvoked:(id)sender forState:(UIControlState)state{
    [self refreshFeed];
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
    //feedUrl=[NSURL URLWithString:@"http://celiarocha.com.br/rss/videos"];
    feedUrl=[NSURL URLWithString:@"http://prerrogativaeaordem.com.br/rss/videos"];
    
    //Configuração de atualização do FEED a partir do usuário
    refreshControl=[[UIRefreshControl alloc] init];
    
    [refreshControl addTarget:self action:@selector(refreshInvoked:forState:) forControlEvents:UIControlEventValueChanged];
    
    NSString *msgAtualizacao=[NSString stringWithFormat:@"Carregando..."];
    
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:msgAtualizacao
                                                                     attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:11.0]}];
    //Adicionando o refreshControl ao tableView
    [self.tableView addSubview:refreshControl];
    
    //Refresh do tableView
    [self refreshFeed];
    
}

@end
