//
//  CalculatorViewController.m
//  Calculator
//
//  Created by William Lee on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

// for dot notation and properties for instance variables
@interface CalculatorViewController()
@property (readonly) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

// Setting the instance variable brain
// Has to be in earlier part of the code because it is private
- (CalculatorBrain *) brain
{
    // Allocate memory for the object and initiate the object
    if (!brain)
        brain = [[CalculatorBrain alloc] init];
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    //NSString *digit = [[sender titleLabel] text];
    NSString *digit = sender.titleLabel.text;
    BOOL justPressedADot = [digit isEqual:@"."];
    
    // If there is no dot already
    // If there exists a dot but digit is not a dot
    // If there exists a dot and digit is a dot
    
    if(!(thereIsADot && justPressedADot))
    {
        // All instance variables are by default zero or NO
        if (userIsInTheMiddleOfTypingANumer) {
            //[display setText:[[display text] stringByAppendingString:digit]];
            display.text = [display.text stringByAppendingString:digit];
            
        }
        else {
            //[display setText:digit];
            display.text = digit;
            userIsInTheMiddleOfTypingANumer = YES;
        }
    }
    if (justPressedADot) {
        thereIsADot = TRUE;
    }
    
}
- (IBAction)operationPressed:(UIButton *)sender
{
    if(userIsInTheMiddleOfTypingANumer) {
        // Remember that in order to use the dot notation to access
        // to access instance variables,
        // We had to create a property for brain up there
        //[[self brain] setOperand:[[display text] doubleValue]];
        // [self brain].operand = [[display text] doubleValue];
        self.brain.operand = [display.text doubleValue];
        userIsInTheMiddleOfTypingANumer = NO;
        thereIsADot = NO;
    }
    
    //titleLabel is a UILabel while text is a NSString
    NSString *operation = [[sender titleLabel] text];
    
    // brain is a private function, which returns a CalculatorBrain
    // double result = [[self brain] performOperation:operation];
    [self.brain performOperation:operation];
    
    // %g means that the following argument is a double
    // Ask Class NSString to format the result (double) as string
    // Ask the instance variable display to set text as follow
    display.text = [NSString stringWithFormat:@"%g", self.brain.operand];

}

@end
