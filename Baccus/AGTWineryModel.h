//
//  AGTWineryModel.h
//  Baccus
//
//  Created by Gabriel on 5/6/15.
//  Copyright (c) 2015 GGS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTWineModel.h"

@interface AGTWineryModel : NSObject

@property (readonly,nonatomic) int redWineCount;
@property (readonly,nonatomic) int whiteWineCount;
@property (readonly,nonatomic) int otherWineCount;

-(AGTWineModel *) redWineAtIndex: (int)index;
-(AGTWineModel *) whiteWineAtIndex: (int)index;
-(AGTWineModel *) otherAtIndex: (int)index;


@end
