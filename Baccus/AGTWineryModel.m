//
//  AGTWineryModel.m
//  Baccus
//
//  Created by Gabriel on 5/6/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import "AGTWineryModel.h"

@interface AGTWineryModel ()

@property (strong,nonatomic) NSArray * redWines;
@property (strong,nonatomic) NSArray * whiteWines;
@property (strong,nonatomic) NSArray * others;


@end

@implementation AGTWineryModel

#pragma mark - Properties

-(int) redWineCount {
    return [self.redWines count];
}

-(int) whiteWineCount {
    return [self.whiteWines count];
}

-(int) otherWineCount {
    return [self.others count];
}




-(id) init {
    
    if(self = [super init]){
        AGTWineModel * tintorro = [AGTWineModel wineWithName:@"Bembibre"
                                             wineCompanyName:@"Dominio de Tares"
                                                        type:@"tinto"
                                                      origin:@"El Bierzo"
                                                       notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                      grapes:@[@"Mencía"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.ggseco.com"]
                                                       photo:[UIImage imageNamed:@"bembibre.jpg"]
                                                      rating:5];
        
        
        AGTWineModel * albarinno = [AGTWineModel wineWithName:@"Zárate"
                                             wineCompanyName:@"Zárate"
                                                        type:@"white"
                                                      origin:@"Rias Bajas"
                                                       notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                      grapes:@[@"Albariño"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                       photo:[UIImage imageNamed:@"zarate.gif"]
                                                      rating:4];
        
        AGTWineModel * champagne = [AGTWineModel wineWithName:@"Comtes de Champagne"
                                             wineCompanyName:@"Champagne Taittinger"
                                                        type:@"other"
                                                      origin:@"Champagne"
                                                       notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                      grapes:@[@"Chardonnay"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                       photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]
                                                      rating:5];
        
        
        self.redWines = @[tintorro];
        
        self.whiteWines = @[albarinno];
        
        self.others = @[champagne];
        
        
    }
    
    return self;
}


-(AGTWineModel *) redWineAtIndex: (int)index {
    
    return [self.redWines objectAtIndex:index];
    
}
-(AGTWineModel *) whiteWineAtIndex: (int)index {
    
    return [self.whiteWines objectAtIndex:index];

    
}
-(AGTWineModel *) otherAtIndex: (int)index {
    
    return [self.others objectAtIndex:index];

}



@end
