//
//  ViewController.h
//  Tap Me
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    NSInteger seconds;
    NSTimer *timer;
}
//creating a property in this manner automatically synthesizes a backing instance variable, a getter, a setter for that property
//so whenever we use temp = self.count ; it makes a call to [self count] that is the getter method
//and when we use self.count = 10; it makes a call to [self setCount: 10] that is the setter method
//we can also access the count property using _count
//check ViewController.m file for auto-generated methods due to this
@property (nonatomic, assign) NSInteger count;

//"+" sign is used to indicate a class method or static method
//the minus, i.e., "-" sign in front of the method name indicates it is an instance method
-(IBAction)buttonPressed;

@end

