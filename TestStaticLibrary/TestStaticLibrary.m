//
//  TestStaticLibrary.m
//  TestStaticLibrary
//
//  Created by Marek Moscichowski on 08/04/14.
//  Copyright (c) 2014 Marek Mościchowski. All rights reserved.
//

#import "TestStaticLibrary.h"
#import "AFHTTPSessionManager.h"
#import <Typhoon/Typhoon.h>

@interface MyAssembly:TyphoonAssembly

@end

@implementation MyAssembly

- (TyphoonDefinition *)registerSth
{
    return [TyphoonDefinition withClass:[UIViewController class]];
}

@end

@implementation TestStaticLibrary

- (NSObject *)runTyphoon
{
    TyphoonComponentFactory *factory = [TyphoonBlockComponentFactory factoryWithAssembly:[MyAssembly assembly]];

    return [factory componentForType:[UIViewController class]];
}

- (void)runAFNetworking
{
    NSString *createSessionResource = @"/test/resource";

    // 1
    NSURL *baseURL = [NSURL URLWithString:@"http://test.com"];
    NSDictionary *parameters = @{@"Test" : @"Test"};

    // 2
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];

    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 3
    [manager POST:createSessionResource parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject)
    {
        NSLog(@"responseObject = %@", responseObject);

    }    failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"error = %@", error);
    }];

}

@end
