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
        
        //@ is used for object creation, in some ways similar to "new" in JAVA

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
        
        NSDictionary *dict = @{@"name": @"Devesh Shetty",
                               @"language": @"ObjectiveC",
                               @"randomNumber": @2132112321
                               };
        
        NSLog(@"%@",dict);
        
        //NSUserDefaults is similar to SharedPreferences in Android
        //NSUserDefaults stores small data across various app launches
        //Never store huge chunk of data in NSUserDefaults
        [[NSUserDefaults standardUserDefaults] setValue:@3 forKey:@"Test"];
        //always remember to write the defaults out after each batch of changes
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        //PropertyList: Every thing in the entire object graph must be a part of the collections: NSArray, NSDictionary, NSString,etc
        //PropertyList is just a term
        //TODO: Explore more on Property List
        
        //NSRange: It is a C struct (not a class)
        //typedef struct{
        //  NSUInteger location;
        //  NSUInteger length;
        //}NSRange;
        NSString *testString = @"I'm a test String";
        // r has the location and length of string "test"
        NSRange r = [testString rangeOfString:@"test"];
        //rNotFound contains a special value NSNotFound
        NSRange rNotFound = [testString rangeOfString:@"NOWhEer"];
        
        //Exploring blocks in ObjectiveC
        //Blocks are Objective-C's anonymous functions
        
        //Declare the block variable
        //the ^ is used to mark the addTwoNumbers variable as a block
        //Like the function declaration, you need to include the return type and parameter types so the compiler can enforce type safety
        double(^addTwoNumbers)( double no1, double no2 );
        //The ^ behaves in a similar manner to the asterisk before a pointer (e.g., int *aPointer) in that it is only required when declaring the block, after which you can use it like a normal variable
        
        //Create and assign the block
        addTwoNumbers = ^double(double no1, double no2){
            return no1 + no2;
        };
        
        //Call the block
        double result = addTwoNumbers(45.4, 3);
        
        NSLog(@"45.4 + 3 = %f",result);
        
        //Paramterless blocks
        //If the block does not take any arguments, we can omit the argument list
        //Specifying the return type of a block literal is optional so we can skip mentioning it
        //Hence, we can just mention the block using ^ {}
        NSUInteger (^generateRandomNumberBetweenOneAnd20)(void) = ^ {
            return (NSUInteger)arc4random() % 20;
        };
        
        NSLog(@"Any random number between 1 and 20: %lu",(unsigned long)generateRandomNumberBetweenOneAnd20());
        
        //Blocks are implemented as closures
        NSString *car = @"Honda";
        //Therefore, blocks also have access to non-local variables
        NSString *(^getCarName)(NSString *) = ^(NSString *model){
            //This block has access to the variable "car"
            //Non-local variables (wrt to block) are copied and stored with block as const variables which means they are read-only
            return [car stringByAppendingFormat:@" %@",model];
        };
        
        NSLog(@"The car is %@", getCarName(@"City"));
        
        //The fact that non-local variables are copied as constants means that a block does not just have access to non-local variables, it creates a snapshot of them
        //Non-local variables are frozen at whatever value they contain when the block is defined and the block always uses that value even if non-local variable change their value later
        
        //changed the value
        car = @"Tesla";
        //but the block getCarName has the value Honda for variable car
        NSLog(@"The car is %@", getCarName(@"Roadster"));
        
        //__block will storage modifier will let the block access the non-local variable by reference
        //hence, we make changes within or outside the block
        __block NSString *phone = @"Apple";
        
        NSString *(^getPhoneName)(NSString *) = ^(NSString *model){
            phone = @"Samsung";
            return [phone stringByAppendingFormat:@" %@",model];
        };
        
        NSLog(@"The phone is %@",getPhoneName(@"iPhone"));
        NSLog(@"The phone value = %@",phone);

        //the __block modifier serves as a "memory" between multiple calls to a block
        __block int i = 0;
        //It creates a block that "remembers" the value of i over subsequent invocations
        int (^count)(void) = ^{
            i++;
            return i;
        };
        
        NSLog(@" %d",count());
        NSLog(@" %d",count());
        NSLog(@" %d",count());
        
    }
    return 0;
}
