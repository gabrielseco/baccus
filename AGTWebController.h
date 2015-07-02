//
//  AGTWebController.h
//  Baccus
//
//  Created by Gabriel on 3/6/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"
@interface AGTWebController : UIViewController <UIWebViewDelegate>

@property(strong,nonatomic) AGTWineModel * model;

@property(weak,nonatomic) IBOutlet UIWebView * browser;
@property(weak,nonatomic) IBOutlet UIActivityIndicatorView * activityView;


-(id)initWithModel:(AGTWineModel *) aModel;

@end
