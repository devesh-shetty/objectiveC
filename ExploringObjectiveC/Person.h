//
//  Person.h
//  ExploringObjectiveC
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    //declaring instance variables
    NSString *firstName;
    NSString *lastName;
    int age;
}
//just declare these methods
-(void)enterInfo;
-(void)printInfo;

@end
