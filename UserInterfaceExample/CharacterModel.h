//
//  CharacterModel.h
//  UserInterfaceExample
//
//  Created by Sammy Timmins on 9/13/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharacterModel : NSObject

-(CharacterModel*)initWithFields:(NSString*)name
                             bio:(NSString*)bio
                           image:(NSString*)image;

-(void)setName:(NSString*)name;

-(void)setBio:(NSString*)bio;

-(void)setImage:(NSString*)image;

-(NSString*)getName;

-(NSString*)getBio;

-(NSString*)getImage;

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* bio;
@property (strong, nonatomic) NSString* image;

@end

NS_ASSUME_NONNULL_END
