//
//  main.m
//  ExploringObjectiveC
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //In Objective-C, strings begin with @ symbol
        NSLog(@"Hello, World!");
        
        //arc4random() generates a random number
        //we make use of modulo operator to generate random number between 1 and 100
        int no = arc4random() % 100 + 1;
        
        //format specifier for int is %i,
        //for float is %f
        //for char is %c
        //There isn't a specific format specifier for BOOL values; print %i of BOOL values gives 1 for YES and 0 for FALSE
        //BOOL values in Objective-c stores a YES or NO value
        NSLog(@"Integer with value %i, Float with value %f, Char with value %c, Boolean value for YES is represented as %i",
                                    no, 22.5, 'y', YES);
        
        int userInput;
        NSLog(@"Enter a number: ");
        //scanf is used to accept input from user
        scanf("%i", &userInput);
        //NSLog(@"User entered the number %i",userInput);
        
        //name is pointer to a NSString object
        //name is an instance of NSString Object
        //A pointer just stores the memory location of the object and not the object itself
        NSString *name = @"Devesh";
        //%@ is a format specifier for references
        NSLog(@"Hello %@",name);
        //[] means we are are sending a message to an object
        //sending a message to an object or calling a method on an object mean the same
        NSString *outputString = [NSString stringWithFormat:@"You have entered the value : %i",userInput];
        NSLog(@"%@",outputString);
        
        char charString[40];
        NSLog(@"Enter a word:");
        //To accept an array of character we use the format specifier %s
        //we don't make use of & to accept input
        scanf("%s",charString);
        //A simple list of characters is known as C String
        //convert the C String into a NSString
        NSString *userEnteredCharacterString = [NSString stringWithCString:charString encoding:1];
        //%li format specifier for NSUInteger
        //NSString also stores a C string, but also provides a host of methods that allow you to do things such as get the string’s length and compare it to other strings.
        NSLog(@"User has entered the word: %@  of length: %li ",userEnteredCharacterString, [userEnteredCharacterString length]);
        
        //Using Custom classes
        //alloc allocates memory for the object
        //init creates and initializes the object that will live at that memory
        Person *person = [[Person alloc] init ];
        
        [person enterInfo];
        [person printInfo];
        
        NSLog(@"Total count of Person Objects: %li",[Person count]);
        
        NSLog(@"Person Object: %@",person);
        
        NSLog(@"Messages sent to nil pointers won't perform any action");
        //nil in Objective C is equivalent to null in JAVA or NULL in C
        person = nil;
        //messages sent to nil references will be ignored; unlike JAVA it won't throw an exception
        [person printInfo];
        
        Student *student = [[Student alloc]init];
        [student enterInfo];
        
        //As we have used instancetype as the return type to init method in the Student class,
        //we will get a student object and not a Person object
        NSLog(@"Student Object: %@",student);
        
        Student *studTwo = [[Student alloc]init];
        NSLog(@"Total student count: %li",[Student count]);
        
        //Arrays
        //NSArray is an immutable array
        //NSMutableArray is a mutable array
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        [mutableArray addObject:@"One"];
        [mutableArray addObject:@"Two"];
        
        NSArray *immutableArray = [[NSArray alloc]initWithArray:mutableArray];
        NSLog(@"Immutable Array");
        for(NSString *str in immutableArray){
            NSLog(@"%@",str);
        }
        
        
        [mutableArray addObject:@"Three"];
        NSLog(@"Mutable Array");
        for(NSString *str in mutableArray){
            NSLog(@"%@",str);
        }
        
        
        //NSNumber
        //creating and using NSNumber
        NSNumber *numInt = @3;
        NSNumber *numBOOl = @YES;
        float intToFloatValue = [numInt floatValue];
        NSNumber *numFloat = [NSNumber numberWithFloat:4.5];
        
        
    }
    return 0;
}
