//
//  CalculatorBrain.h
//  Calculator
//
//  Created by William Lee on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
@private
    double operand;
    double waitingOperand;      // First operand
    double storedOperand;
    NSString *waitingOperation; // For the operation that is waiting to be 
                                // performed until it gets
                                // its second operand
}

@property double operand;
- (double)performOperation:(NSString *)operation;

@end
