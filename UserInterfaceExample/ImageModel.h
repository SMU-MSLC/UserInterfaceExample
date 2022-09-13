//
//  ImageModel.h
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CharacterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;

-(CharacterModel*)getCharacter:(NSString*)name;

-(void)removeCharacter:(NSString*)name;

-(void)addCharacter:(NSString*)name
                bio:(NSString*)bio
              image:(NSString*)image;

-(int)getNumberOfCharacters;

@property (strong, nonatomic) NSMutableArray<CharacterModel*>* imageNames;

@end

NS_ASSUME_NONNULL_END
