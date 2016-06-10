//
//  ViewController.m
//  Tap Me
//
//  Created by Devesh Shetty on 10/06/16.
//  Copyright © 2016 Devesh Shetty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpGame{
    
    seconds = 30;
    _count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score \n%li",self.count];
    
    //param 1 the time interval
    //target is which instance to send a message to every second. Here, we want the message to go to the View Controller hence the target is self
    //selector is what method we want to call. We specify the method using @selector();
    //userInfo is any extra info you want stored with the timer
    //repeat = YES because we want the timer to repeat itself
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
}

-(void)subtractTime{
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",seconds];
    
    if(seconds == 0){
        //stop the timer
        [timer invalidate];
        
        //create an alertView
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time is Up" message:[NSString stringWithFormat: @"You have scored %li points",self.count] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *playAgainAction = [UIAlertAction actionWithTitle: @"Play again" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                [self setUpGame];
            }];
        
        [alert addAction:playAgainAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(IBAction)buttonPressed{
    self.count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score \n%li",self.count];
}

@end
