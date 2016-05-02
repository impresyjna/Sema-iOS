//
//  SEEnvironment.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEEnvironment.h"
@interface SEEnvironment ()
@property (nonatomic, copy) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;
@end

@implementation SEEnvironment

#pragma mark - 
#pragma mark - Initialization

+ (SEEnvironment *)sharedConfiguration {
    static SEEnvironment *sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfiguration = [[self alloc] init];
    });
    return sharedConfiguration;
}

- (instancetype)initWithConfiguration:(NSString *)configuration {
    self = [super init];
    if (self) {
        self.configuration = configuration;
        
        NSString *pathConfiguration = [self.bundle pathForResource:@"Configuration" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:pathConfiguration];
        
        NSMutableDictionary *defaultEnvironment = [configurations[@"Default"] mutableCopy];
        NSDictionary *currentEnvironment = configurations[self.configuration];
        
        if(currentEnvironment) {
            [defaultEnvironment addEntriesFromDictionary:currentEnvironment];
        }
        
        self.variables = [defaultEnvironment copy];
    }
    return self;
}

- (instancetype)init {
    NSString *configuration = [[self.bundle infoDictionary] objectForKey:@"Configuration"];
    
    return [self initWithConfiguration:configuration];
}

#pragma mark -
#pragma mark - Public

- (NSURL *)apiBaseURL {
    NSString *URLString = self.variables[kSEEnvironmentApiBaseURLKey];
    return [NSURL URLWithString:URLString];
}

- (id)variableForKey:(NSString *)key {
    return self.variables[key];
}

#pragma mark - 
#pragma mark - Private

- (NSBundle *)bundle {
    return [NSBundle mainBundle];
}

@end
