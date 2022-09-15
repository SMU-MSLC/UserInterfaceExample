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

- (NSDictionary *)JSONFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(NSMutableArray*) parseJSON {
    NSDictionary* parsed = [self JSONFromFile];
    NSArray* characters = [parsed objectForKey:@"characters"];
    NSMutableArray *toReturn;
    
    for(NSDictionary* character in characters) {
        NSString* name = [character objectForKey:@"name"];
        NSString* bio = [character objectForKey:@"bio"];
        NSString* image = [character objectForKey:@"image"];
        
        [self.imageNames addObject:[[CharacterModel alloc] initWithFields:name bio:bio image:image]];
    }
    
    return toReturn;
}

-(NSMutableArray<CharacterModel*>*) imageNames{
    if(!_imageNames) {
       _imageNames = [[NSMutableArray alloc] init];
        [self parseJSON];
    }
        
    
    return _imageNames; 
}


-(UIImage*)getImageWithName:(NSString*)name {
    for(CharacterModel *character in self.imageNames) {
        if([character getName] == name) {
            return [UIImage imageNamed:[character getImage]];
        }
    }
    
    return nil;
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
    return (int)self.imageNames.count;
}

@end
