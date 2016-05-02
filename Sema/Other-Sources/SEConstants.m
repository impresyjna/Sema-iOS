//
//  SEConstants.m
//  Sema
//
//  Created by Joanna Furmaniak on 5/2/16
//  Copyright (c) 2014 The Company. All rights reserved.
//

#import "Sema-Environment.h"

// Use this file to define the values of the variables declared in the header.
// For data types that aren't compile-time constants (e.g. NSURL), use the
// SEConstantsInitializer function below.

// See Sema-Environment.h for macros that are likely applicable in
// this file. TARGETING_{STAGING,PRODUCTION} and IF_STAGING are probably
// the most useful.

// The values here are just examples.

#ifdef TARGETING_STAGING

//NSString * const SEAPIKey = @"StagingKey";

#else

//NSString * const SEAPIKey = @"ProductionKey";

#endif


//NSURL *SEAPIRoot;
void __attribute__((constructor)) SEConstantsInitializer()
{
//    SEAPIRoot = [NSURL URLWithString:IF_STAGING(@"http://myapp.com/api/staging", @"http://myapp.com/api")];
}