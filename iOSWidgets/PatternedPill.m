//
//  PatternedPill.m
//  iOSWidgets
//
//  Created by Julian Ceipek on 8/2/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import "PatternedPill.h"

@implementation PatternedPill

- (id)initWithTop:(float)top left:(float)left width:(float)width height:(float)height roundLeft:(BOOL)doRoundLeft right:(BOOL)doRoundRight {
    self = [super init];
    roundLeft = doRoundLeft;
    roundRight = doRoundRight;
    [self setBounds:CGRectMake(0, 0, width, height)];
    [self setPosition:CGPointMake(left, top)];
    return self;
}

- (void)drawInContext:(CGContextRef)context {
    [super drawInContext:context];
    
    //CGColorRef whiteColor = [UIColor redColor].CGColor;
    //CGContextSetFillColorWithColor(context, whiteColor);
    
    if (!roundLeft && !roundRight) {
        CGContextFillRect(context, self.bounds);
    } else {
        float radius = self.bounds.size.height/2.0f;
        float leftOffset = 0.0f;
        float rightOffset = 0.0f;
        
        if (roundLeft) {
            leftOffset = radius;
        }
        if (roundRight) {
            rightOffset = radius;
        }
        
        CGContextMoveToPoint(context, self.bounds.origin.x + leftOffset, self.bounds.origin.y); //TopLeft
        CGContextAddLineToPoint(context, self.bounds.size.width - rightOffset, self.bounds.origin.y); //TopRight
        
        // Right Cap if necessary
        if (roundRight) {
            CGContextAddArc(context, self.bounds.size.width - rightOffset, radius,
                            radius, 3.0f/2.0f*M_PI, M_PI/2.0f, 0);
        } else {
            CGContextAddLineToPoint(context, self.bounds.size.width - rightOffset, self.bounds.size.height);
        }
        
        CGContextAddLineToPoint(context, self.bounds.origin.x + leftOffset, self.bounds.size.height); //BottomLeft
 
        // Left Cap if necessary
        if (roundLeft) {
            CGContextAddArc(context, self.bounds.origin.x + leftOffset, radius,
                            radius, M_PI/2.0f, 3.0f/2.0f*M_PI, 0);
        } else {
            CGContextAddLineToPoint(context, self.bounds.origin.x + leftOffset, self.bounds.origin.y);
        }
        
        CGContextFillPath(context);
    }
    
    static const CGPatternCallbacks callbacks = { 0, &MyDrawColoredPattern, NULL };
    
    CGContextSaveGState(context);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    CGPatternRef pattern = CGPatternCreate(NULL,
                                           self.bounds,
                                           CGAffineTransformIdentity,
                                           24,
                                           24,
                                           kCGPatternTilingConstantSpacing,
                                           true,
                                           &callbacks);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(context, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(context, self.bounds);
    CGContextRestoreGState(context);
    
}

void MyDrawColoredPattern (void *info, CGContextRef context) {
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGContextSetStrokeColorWithColor(context, whiteColor);
    
    CGContextMoveToPoint(context, 0, 3);
    CGContextAddLineToPoint(context, 5, 3);
    CGContextStrokePath(context);
}


@end
