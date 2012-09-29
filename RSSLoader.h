//
//  RSSLoader.h
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface RSSLoader : NSObject{
    NSMutableArray *colecaoDeLinksDeImagens;
}

@property (strong, nonatomic) NSMutableArray *colecaoDeLinksDeImagens;

typedef void (^RSSLoaderCompleteBlock)(NSString* title, NSArray* results);


-(void)fetchRssWithURL:(NSURL*)url complete:(RSSLoaderCompleteBlock)c;


@end
