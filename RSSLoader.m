//
//  RSSLoader.m
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "RSSLoader.h"
#import "RXMLElement.h"
#import "RSSItens.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@implementation RSSLoader
@synthesize colecaoDeLinksDeImagens;
-(void)fetchRssWithURL:(NSURL *)url complete:(RSSLoaderCompleteBlock)c{
    dispatch_async(kBgQueue, ^{

        
    RXMLElement *rss = [RXMLElement elementFromURL: url];
    RXMLElement* tituloXML = [[rss child:@"channel"] child:@"title"];
        //RXMLElement *linkXML = [[rss child:@"channel"] child:@"link"];
        NSArray* items = [[rss child:@"channel"] children:@"item"];
        
    //RXMLElement* urlXML = [[rss child:@"channel"] child:@"url"];
    //XMLElement* subtituloXML = [[rss child:@"channel"] child:@"description"];
    //NSString *urlImg=[[rss child:@"url"] text];
    
    NSMutableArray* resultadoDoXMLRecebido = [NSMutableArray arrayWithCapacity:items.count];
    
     // Envia os itens recebidos do XML ao item RSSItens
        for (RXMLElement *e in items) {
            
            //iterate over the articles
            RSSItens* item = [[RSSItens alloc] init];
            item.titulo = [[e child:@"title"] text]; //Título
            item.subtitulo = [[e child:@"description"] text]; //Subtítulo
            item.link = [NSURL URLWithString: [[e child:@"link"] text]];
            
            [resultadoDoXMLRecebido addObject: item];
        }
        c([tituloXML text], resultadoDoXMLRecebido);
});
}


@end

