//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSMutableArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[[[CharacterModel alloc] initWithFields:@"Spongebob"
                                                           bio:@"SpongeBob is a childish, joyful, and clumsy sea sponge who lives in a pineapple with his pet snail Gary in the underwater city of Bikini Bottom. He works as a fry cook at the Krusty Krab, a job which he is exceptionally skilled at and enjoys thoroughly. He attends Mrs. Puff's Boating School, and his greatest dream in life is to receive his boating license. Unfortunately, he tenses up whenever he has to drive a boatmobile, and he drives recklessly. SpongeBob is very good-natured and loves to hang out with his best friend, Patrick. His teacher is Mrs. Puff and his boss is Mr. Krabs."
                                                         image:@"spongebob"]];
    
    return _imageNames; 
}


-(UIImage*)getImageWithName:(NSString*)name{
    NSString *imageName = nil;
    for(CharacterModel *character in self.imageNames) {
        if([character getName] == name) {
            imageName = [character getImage];
            break;
        }
    }
    
    UIImage* image = nil;
    
    image = [UIImage imageNamed:imageName];
    
    return image;
}

-(CharacterModel*)getCharacter:(NSString*)name {
    for(CharacterModel *character in self.imageNames) {
        if([character getName] == name) {
            return character;
        }
    }
    
    return nil;
}

-(void)removeCharacter:(NSString*)name {
    for(NSInteger i = 0; i < self.imageNames.count; i++) {
        if([self.imageNames[i] getName] == name) {
            [self.imageNames removeObjectAtIndex:i];
            return;
        }
    }
}

-(void)addCharacter:(NSString*)name bio:(NSString*)bio image:(NSString*)image {
    [self.imageNames addObject:[[CharacterModel alloc] initWithFields:name bio:bio image:image]];
}

-(int)getNumberOfCharacters {
    return self.imageNames.count;
}

@end
