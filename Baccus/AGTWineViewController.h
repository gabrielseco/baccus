//
//  AGTWineViewController.h
//  Baccus
//
//  Created by Gabriel on 25/5/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTWineModel.h"

@interface AGTWineViewController : UIViewController <UISplitViewControllerDelegate>
//views

@property (weak,nonatomic) IBOutlet UILabel * nameLabel;
@property (weak,nonatomic) IBOutlet UILabel * wineryNameLabel;
@property (weak,nonatomic) IBOutlet UILabel * typeLabel;
@property (weak,nonatomic) IBOutlet UILabel * originLabel;
@property (weak,nonatomic) IBOutlet UILabel * grapesLabel;
@property (weak,nonatomic) IBOutlet UILabel * notesLabel;
@property (weak,nonatomic) IBOutlet UIImageView * photoView;

@property (strong,nonatomic) IBOutletCollection(UIImageView) NSArray * ratingViews;


//views methods


-(IBAction)displayWeb:(id)sender;


//modelo
@property (strong,nonatomic) AGTWineModel * model;


-(id)initWithModel:(AGTWineModel *) aModel;



@end
