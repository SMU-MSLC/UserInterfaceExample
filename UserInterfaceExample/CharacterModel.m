//
//  CharacterModel.m
//  UserInterfaceExample
//
//  Created by Sammy Timmins on 9/13/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

#import "CharacterModel.h"

@implementation CharacterModel
@synthesize name = _name;
@synthesize bio = _bio;
@synthesize image = _image;

-(CharacterModel*)initWithFields:(NSString *)name bio:(NSString *)bio image:(NSString *)image {
    _name = name;
    _bio = bio;
    _image = image;
    
    return self;
}

-(void)setName:(NSString*)name {
    _name = name;
}

-(void)setBio:(NSString*)bio {
    _bio = bio;
}

-(void)setImage:(NSString*)image {
    _image = image;
}

-(NSString*)getName {
    if(!_name) {
        _name = nil;
    }
    
    return _name;
}

-(NSString*)getBio {
    if(!_bio) {
        _bio = nil;
    }
    
    return _bio;
}

-(NSString*)getImage {
    if(!_image) {
        _image = nil;
    }
    
    return _image;
}


@end
