//
//  AGTWineViewController.m
//  Baccus
//
//  Created by Gabriel on 25/5/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import "AGTWineViewController.h"
#import "AGTWebController.h"
#import "AGTWineryTableViewController.h"


@implementation AGTWineViewController

//pilla por defecto el xib y conectamos el controlador con el modelo

-(id)initWithModel:(AGTWineModel *) aModel{
    
    if(self = [super initWithNibName:nil
                              bundle:nil]){
        _model = aModel;
        self.title = aModel.name;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//MANTIENE SINCRONIZADOS MODELO Y VISTA
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self syncModelWithView];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//views methods

-(IBAction)displayWeb:(id)sender{
    
    //NSLog(@"Go to %@",self.model.wineCompanyWeb);
    
    //crear un webVC
    
    AGTWebController * webVC = [[AGTWebController alloc]initWithModel:self.model];
    
    //HACEMOS UN PUSH
    
    [self.navigationController pushViewController:webVC animated:YES];
    
    

}


#pragma mark -UISplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc
    willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc {
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.rightBarButtonItem = nil;
    
}


-(void)wineryTableViewController:(AGTWineryTableViewController *)wineryVC didSelectWine:(AGTWineModel *)aWine{
    
    self.model = aWine;
    self.title = aWine.name;
    
    [self syncModelWithView];
}






#pragma mark -Utils

-(void)syncModelWithView{
    
    self.nameLabel.text = self.model.name;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString:self.model.grapes];
    
    [self displayRating:self.model.rating ];
    
    [self.notesLabel setNumberOfLines:0];
    
    
}

-(NSString *) arrayToString:(NSArray *) anArray{
    
    NSString * cadena = nil;
    
    if([anArray count] == 1){
        cadena = [@"100%" stringByAppendingString:[anArray lastObject]];
    } else {
        cadena = [[anArray componentsJoinedByString:@","] stringByAppendingString:@"."];
    }
    
    return cadena;
}

-(void)displayRating:(int)aRating{
    
    [self clearRatings];
    
    UIImage * glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i<aRating; i++) {
        [[self.ratingViews objectAtIndex:i]setImage:glass ];
    }
    
}

-(void)clearRatings{
    for(UIImageView * imgView in self.ratingViews){
        imgView.image = nil;
    }
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
