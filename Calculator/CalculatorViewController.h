//
//  CalculatorViewController.h
//  Calculator
//
//  Created by William Lee on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController
{
    CalculatorBrain * brain; // an instance variable that points to our Model
    IBOutlet UILabel * display; // an instance variable that points to objects 
                                // in our View
    BOOL userIsInTheMiddleOfTypingANumer;
    BOOL thereIsADot;
}

// methods that are goint to be sent to us from our View
// IBAction is the same as void except that the Interface Builder knows to pay attention
// to this method
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end
