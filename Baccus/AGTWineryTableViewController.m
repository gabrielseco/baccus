//
//  AGTWineryTableViewController.m
//  Baccus
//
//  Created by Gabriel on 5/6/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import "AGTWineryTableViewController.h"
#import "AGTWineModel.h"
#import "AGTWineViewController.h"

@interface AGTWineryTableViewController ()

@end

@implementation AGTWineryTableViewController

-(id)initWithModel:(AGTWineryModel *)aModel style:(UITableViewStyle) aStyle {
    
    if ( self = [super initWithStyle:aStyle]){
        
        _model = aModel;
        
        self.title = @"Baccus";
    }
    
    return self;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if ( section == RED_WINE_SECTION ) {
        
        return @"Red wines";
        
    }
    
    else if ( section == WHITE_WINE_SECTION ) {
        
        return @"White Wines";
        
    } else {
        
        return @"Other Wines";
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    
    if ( section == RED_WINE_SECTION ) {
        
        return self.model.redWineCount;
    
    }
    
    else if ( section == WHITE_WINE_SECTION ) {
        
        return self.model.whiteWineCount;
    
    } else {
        
        return self.model.otherWineCount;
    }
    
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier  = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ( cell == nil ) {
        
        cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    //averiguar de qué modelo (vino) nos están hablando
    
    AGTWineModel * wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherAtIndex:indexPath.row];
    }
    
    //sincronizar celda y vista
    
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text  = wine.wineCompanyName;
    
    
    
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //SUPONEMOS QUE ESTAMOS EN UN NAVIGATION CONTROLLER
    
    AGTWineModel * wine = nil;
    
    
    
    //AVERIGUAMOS DE QUE VINO SE TRATA
    
    if ( indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    } else {
        wine = [self.model otherAtIndex:indexPath.row];
    }

    
    
    
    
    [self.delegate wineryTableViewController:self
                               didSelectWine:wine ];
    
    NSNotification * n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                       object:self
                                                     userInfo:@{WINE_KEY:wine}];
    
    [[NSNotificationCenter defaultCenter]postNotification:n];
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
