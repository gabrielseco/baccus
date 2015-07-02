//
//  AGTWineModel.h
//  Baccus
//
//  Created by Gabriel on 24/5/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define NO_RATING -1

@interface AGTWineModel : NSObject

@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * wineCompanyName;
@property (strong,nonatomic) NSString * type;
@property (strong,nonatomic) NSString * notes;
@property (strong,nonatomic) NSString * origin;

@property (strong,nonatomic) NSArray * grapes;


@property (strong,nonatomic) NSURL * wineCompanyWeb;


@property (strong,nonatomic) UIImage * photo;

@property (nonatomic) int rating; // 0 - 5



//MÉTODOS DE CLASE

+(id)wineWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin
            notes:(NSString *)aNotes
           grapes:(NSArray  *)arrayOfGrapes
   wineCompanyWeb:(NSURL    *)aWineCompanyWeb
            photo:(UIImage  *)aPhoto
           rating:(int)aRating;



+(id)wineWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin;





//DESIGNADO

-(id) initWithName:(NSString *)aName
   wineCompanyName:(NSString *)aWineCompanyName
              type:(NSString *)aType
            origin:(NSString *)anOrigin
             notes:(NSString *)aNotes
            grapes:(NSArray  *)arrayOfGrapes
    wineCompanyWeb:(NSURL    *)aWineCompanyWeb
             photo:(UIImage  *)aPhoto
            rating:(int)aRating;


//CONVENIENCIA

-(id)initWithName:(NSString *)aName
  wineCompanyName:(NSString *)aWineCompanyName
             type:(NSString *)aType
           origin:(NSString *)anOrigin;










@end
