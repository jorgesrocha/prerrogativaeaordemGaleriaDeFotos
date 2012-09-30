//
//  FotosViewController.h
//  prerrogativaeaordemGaleriaDeFotos
//
//  Created by Jorginho on 25/09/12.
//  Copyright (c) 2012 Jorginho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FotosViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) NSMutableArray *_bibliotecaPrincipal;
@property (strong, nonatomic) NSMutableArray *_bibliotecaDeImagens;
//@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

-(void)carrgaListaDeLinks;



@end
