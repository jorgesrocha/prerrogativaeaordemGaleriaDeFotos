//
//  InfoGaleriaDeFotos.h
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoGaleriaDeFotos : NSObject{
    NSURL *link;
}
@property(strong,nonatomic) NSString *titulo,*subtitulo,*urlFotos;
@property(strong,nonatomic) NSURL *link;
@end
