//
//  Person.m
//  ExploringObjectiveC
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import "Person.h"

@implementation Person

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
