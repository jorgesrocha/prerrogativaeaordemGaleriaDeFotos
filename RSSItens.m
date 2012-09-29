//
//  RSSItens.m
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import "RSSItens.h"

@implementation RSSItens

@synthesize titulo,subtitulo,link,mensagemDaCelula,colecaoDeImagens;
/*
-(NSAttributedString *)mensagemDaCelula{
    if (mensagemDaCelula==nil) return mensagemDaCelula;
    
    
    NSDictionary *boldStyle=@{NSFontAttributeName:[UIFont fontWithName:@"Heveltica-Bold" size:16.0]};
    NSDictionary *normalStyle=@{NSFontAttributeName:[UIFont fontWithName:@"Heveltica" size:6.0]};
        NSMutableAttributedString *artigo=[[NSMutableAttributedString alloc] initWithString:self.titulo];
    [artigo setAttributes:boldStyle range:NSMakeRange(0, self.titulo.length)];
    [artigo appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
     
    
}
 */
@end
