//
//  AGTWineModel.m
//  Baccus
//
//  Created by Gabriel on 24/5/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import "AGTWineModel.h"

@implementation AGTWineModel


#pragma mark - Class Methods


+(id)wineWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin
            notes:(NSString *)aNotes
           grapes:(NSArray  *)arrayOfGrapes
   wineCompanyWeb:(NSURL    *)aWineCompanyWeb
            photo:(UIImage  *)aPhoto
           rating:(int)aRating{
    
    return [[self alloc ]initWithName:aName
                       wineCompanyName:aWineCompanyName
                                  type:aType
                                origin:anOrigin
                                 notes:aNotes
                                grapes:arrayOfGrapes
                        wineCompanyWeb:aWineCompanyWeb
                                 photo:aPhoto
                                rating:aRating];
}



+(id)wineWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin{
    return [[self alloc]initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin];
}

#pragma mark -Init

-(id) initWithName:(NSString *)aName
   wineCompanyName:(NSString *)aWineCompanyName
              type:(NSString *)aType
            origin:(NSString *)anOrigin
             notes:(NSString *)aNotes
            grapes:(NSArray  *)arrayOfGrapes
    wineCompanyWeb:(NSURL    *)aWineCompanyWeb
             photo:(UIImage  *)aPhoto
            rating:(int)aRating{
    
    if(self = [super init]){
        //ASIGANOS LOS PARAMETROS A LAS VARIABLES DE INSTANCIA
        //AQUI NO LO HACEMOS CON [self setName:aName];
        //POR SI EL OBJETO NO ESTÁ CREADO
        //CLASE 35 UDEMY
        
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _notes = aNotes;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aWineCompanyWeb;
        _photo = aPhoto;
        _rating = aRating;
        
    }
    
    return self;
    
}

#pragma mark -Conveniencia
    
-(id)initWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin{
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                        notes:nil
                       grapes:nil
               wineCompanyWeb:nil
                        photo:nil
                       rating:NO_RATING];
}


@end
