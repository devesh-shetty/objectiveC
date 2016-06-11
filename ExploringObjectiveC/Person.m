//
//  Person.m
//  ExploringObjectiveC
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import "Person.h"

@interface Person()
-(void)privateMethod;

@end

@implementation Person

static NSUInteger count = 0;

-(instancetype)init{
    self = [super init];
    count++;
    return self;
}

-(void)privateMethod{
    NSLog(@"I'm a private method");
}

+(NSUInteger)count{
    return count;
}


-(void)enterInfo{
    NSLog(@"Enter FirstName: ");
    char fname[30];
    scanf("%s",fname);
    firstName = [NSString stringWithCString:fname encoding:1];
    
}

-(void)printInfo{
    NSLog(@"Username : %@",firstName);
    
}

@end
