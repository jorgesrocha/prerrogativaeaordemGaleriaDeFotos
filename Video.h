//
//  Video.h
//  Feed[test]
//
//  Created by Jorginho on 27/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject{
    NSURL *url;
    NSString *titulo,*subtitulo;
}
@property (nonatomic, strong) NSURL *url;
@property NSString *titulo,*subtitulo;


@end
