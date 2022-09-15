//
//  SettingsModel.m
//  UserInterfaceExample
//
//  Created by Sammy Timmins on 9/15/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

#import "SettingsModel.h"

@implementation SettingsModel
@synthesize background = _background;

+(SettingsModel*)sharedInstance{
    static SettingsModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[SettingsModel alloc] init];
    } );
    return _sharedInstance;
}

-(UIColor*)background{
    if(!_background) {
        _background = UIColor.systemBackgroundColor;
    }
    
    return _background;
}

@end
