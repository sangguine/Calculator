//
//  CalculatorBrain.m
//  Calculator
//
//  Created by William Lee on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#import "math.h"

@implementation CalculatorBrain

@synthesize operand;

// It's important that this code is before the implementation of performOperation
// Because it is a private method, it must be declared before it is used.
- (void) performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    if ([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    if ([@"/" isEqual:waitingOperation])
    {
        if (operand) 
        {
            operand = waitingOperand / operand;
        }
    }
}


- (double)performOperation:(NSString *)operation
{
    // [objectToSendMessageTo nameOfMessage:argument];
    if([operation isEqual:@"sqrt"])
    {
        operand = sqrt(operand);
    }
    else if ([@"+/-" isEqual:operation])
    {
        operand = - operand;
    }
    else if ([@"1/x" isEqual:operation])
    {
        if (operand)
        {
            operand = 1 / operand;
        }
    }
    else if ([@"sin" isEqual:operation])
    {
        operand = sin(operand);
    }
    else if ([@"cos" isEqual:operation])
    {
        operand = cos(operand);
    }
    else if ([@"Store" isEqual:operation])
    {
        storedOperand = operand;
    }
    else if ([@"Recall" isEqual:operation])
    {
        operand = storedOperand;
    }
    else if ([@"Mem+" isEqual:operation])
    {
        storedOperand += operand;
    }
    else if ([@"C" isEqual:operation])
    {
        operand = 0;
        storedOperand = 0;
        waitingOperand = 0;
        waitingOperation = NULL;
    }
    else
    {
        // Send the message to the object that is currently sending the message
        // performWaitingOperation is private, so it is not in the header file
        [self performWaitingOperation]; // same as "this" in C++
        waitingOperand = operand;       // Let the first operand wait
        waitingOperation = operation;   // Let the first operation wait
    }
    return operand;
}

@end
