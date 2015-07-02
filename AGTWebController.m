//
//  AGTWebController.m
//  Baccus
//
//  Created by Gabriel on 3/6/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import "AGTWebController.h"
#import "AGTWineryTableViewController.h"


@implementation AGTWebController


-(id)initWithModel:(AGTWineModel *) aModel{
    if(self =[super initWithNibName:nil
                             bundle:nil]){
        _model = aModel;
        self.title = @"Web";
    }
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL:self.model.wineCompanyWeb];
    
    
    //ALTA NOTIFICACION
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
                                     
    [center addObserver:self
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME
                 object:nil];

    
}
                                     
-(void)wineDidChange:(NSNotification *) notification {
    
    NSDictionary * dict = [notification userInfo];
    AGTWineModel * newWine = [dict objectForKey:WINE_KEY];
    
    
    self.model = newWine;
   [self displayURL:self.model.wineCompanyWeb];
                                         
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //BAJA EN LA NOTIFICACION
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
                                     
    
    
}

#pragma mark -Utils

-(void)displayURL: (NSURL *) aURL{
    
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    
    [self.activityView startAnimating];
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
    
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
