//
//  UIColor+Tools.m
//  Itau
//
//  Created by a2works on 15/05/15.
//  Copyright (c) 2015 Pérsio GV. All rights reserved.
//

#import "UIColor+Tools.h"

@implementation UIColor (Tools)

- (UIColor *)colorByChangingAlphaTo:(CGFloat)newAlpha
{
    // oldComponents is the array INSIDE the original color
    // changing these changes the original, so we copy it
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents([self CGColor]);
    NSInteger numComponents = CGColorGetNumberOfComponents([self CGColor]);
    CGFloat newComponents[4];
    
    switch (numComponents)
    {
        case 2:
        {
            //grayscale
            newComponents[0] = oldComponents[0];
            newComponents[1] = oldComponents[0];
            newComponents[2] = oldComponents[0];
            newComponents[3] = newAlpha;
            break;
        }
        case 4:
        {
            //RGBA
            newComponents[0] = oldComponents[0];
            newComponents[1] = oldComponents[1];
            newComponents[2] = oldComponents[2];
            newComponents[3] = newAlpha;
            break;
        }
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
    
    UIColor *retColor = [UIColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
    
    return retColor;
}

@end
