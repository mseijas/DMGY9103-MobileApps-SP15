//
//  BNRHypnosisView.m
//  Hypnotizer
//
//  Created by Matias Seijas on 2/7/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

 
- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;

    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumbscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
        
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    
    
    
    // Draw the triangle
    
    CGPoint triangleVertex1 = CGPointMake(160, 106);
    CGPoint triangleVertex2 = CGPointMake(63, 394);
    CGPoint triangleVertex3 = CGPointMake(255, 394);
    
    UIBezierPath *clippingMask = [[UIBezierPath alloc] init];
    
    [clippingMask moveToPoint:triangleVertex1];
    [clippingMask addLineToPoint:triangleVertex2];
    [clippingMask addLineToPoint:triangleVertex3];
    [clippingMask closePath];
    
    [clippingMask fill];
    
    
    
    // Core Graphics
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    
    // Grandient Rendering
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.18, 0.8, 0.44, 1.0,
                              1.0, 1.0, 0.0, 1.0 };
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = { 0, 0 };
    CGPoint endPoint = { 0, 480 };
    
    
    CGContextSaveGState(currentContext);
    
        [clippingMask addClip];
    
        CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGContextRestoreGState(currentContext);
    
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
  
    
    
    // Logo + Shadow Rendering
    
    CGContextSaveGState(currentContext);
    
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(bounds.size.width / 4, bounds.size.height / 4, bounds.size.width / 2, bounds.size.height / 2)];
    
    CGContextRestoreGState(currentContext);
    
    
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
