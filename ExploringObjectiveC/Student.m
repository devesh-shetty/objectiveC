//
//  Student.m
//  ExploringObjectiveC
//
//  Created by Devesh Shetty on 12/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import "Student.h"

@implementation Student

#pragma mark - Superclass Methods
-(instancetype)init{
    
    //By making use of instancetype for return type, we are guaranteed that subclasses will return an object of subclass
    
    self = [super init];
    
    if(self){
        //perform some work
        
    }
    
    return self;
}

//equivalent toString in Java
//so whenever we try to print a student Object this method is called
//e.g NSLog(@"%@",studentObject); this leads to calling description on that student object
-(NSString *)description{
    return @"I'm a student";
}

@end
