//
//  PatternedPill.m
//  iOSWidgets
//
//  Created by Julian Ceipek on 8/2/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import "PatternedPill.h"

@implementation PatternedPill

- (id)initWithTop:(float)top left:(float)left width:(float)width height:(float)height roundLeft:(BOOL)doRoundLeft right:(BOOL)doRoundRight backgroundColor:(CGColorRef)backgroundColor {
    self = [super init];
    bgColor = backgroundColor;
    roundLeft = doRoundLeft;
    roundRight = doRoundRight;
    [self setBounds:CGRectMake(0, 0, width, height)];
    [self setPosition:CGPointMake(left, top)];
    return self;
}

- (void)drawInContext:(CGContextRef)context {
    [super drawInContext:context];
    
    CGContextSetFillColorWithColor(context, bgColor);
    
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
    
    //Adapted from Core Graphics 101: Patterns (broken links at the moment)
    static const CGPatternCallbacks callbacks = { 0, &StripedPattern, NULL };
    
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    CGSize size = self.bounds.size;
    
    CGPatternRef pattern = CGPatternCreate(&size,
                                           self.bounds,
                                           CGAffineTransformIdentity,
                                           15,
                                           size.height,
                                           kCGPatternTilingConstantSpacing,
                                           true,
                                           &callbacks);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(context, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(context, self.bounds);
    
}

void StripedPattern (void *info, CGContextRef context) {
    
    CGSize *size = (CGSize *)info;
    
    CGColorRef whiteColor = [UIColor whiteColor].CGColor;
    CGContextSetStrokeColorWithColor(context, whiteColor);
    
    CGContextSetLineWidth(context, size->height/7.0f);
    
    CGContextMoveToPoint(context, 0, size->height/2.0f);
    CGContextAddLineToPoint(context, 7, size->height/2.0f);
    CGContextStrokePath(context);
}


@end
