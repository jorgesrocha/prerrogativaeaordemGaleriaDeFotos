//
//  RSSItens.h
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItens : NSObject{
    NSString *titulo,* subtitulo;
    NSURL *link;
    NSAttributedString *mensagemDaCelula;
    NSURL *linkDaImagem;
}

@property(strong, nonatomic) NSString *titulo, *subtitulo;
@property(strong, nonatomic) NSURL *link;
@property(strong, nonatomic) NSAttributedString *mensagemDaCelula;
@property(strong, nonatomic) NSArray *colecaoDeImagens;
//-(NSAttributedString *)cellMessage;


@end

