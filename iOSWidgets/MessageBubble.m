//
//  MessageBubble.m
//  iOSWidgets
//
//  Created by Julian Ceipek on 7/31/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import "MessageBubble.h"

@implementation MessageBubble

- (id)initWithText:(NSString*)theText originX:(float)x y:(float)y fontSize:(float)theFontSize radius:(float)theRadius {
    self = [super init];
    text = theText;
    fontSize = theFontSize;
    radius = theRadius;
    
    CGSize size = [text sizeWithFont:[UIFont fontWithName:@"TrebuchetMS-Italic" size:fontSize]];
    [self setBounds:CGRectMake(0, 0, size.width*1.20, size.height*1.20)];
    [self setPosition:CGPointMake(x, y)];
    return self;
}

- (void)drawInContext:(CGContextRef)context {
    [super drawInContext:context];
    
    float flagHeight = self.bounds.size.height/5.0f;
    float flagWidth = self.bounds.size.height/5.0f;
    float height = self.bounds.size.height - flagHeight;
    float width = self.bounds.size.width;
    
    CGPoint origin = CGPointMake(self.bounds.size.width, self.bounds.size.height); // Where the flag is pointing
    
    CGContextSetRGBFillColor(context, 95.0/255.0, 211.0/255.0, 95.0/255.0, 1); // BG Color
    
    CGContextMoveToPoint(context, origin.x, origin.y); //FlagBottom
    CGContextAddLineToPoint(context, origin.x, origin.y-flagHeight-height+radius); //FlagTopRight
    CGContextAddArc(context, origin.x-radius, origin.y-flagHeight-height+radius,
                    radius, 0.0, M_PI*3.0/2.0, 1); //Top Right Radius
    
    CGContextAddLineToPoint(context, origin.x-width+radius, origin.y-flagHeight-height); //Top Left
    CGContextAddArc(context, origin.x-width+radius, origin.y-flagHeight-height+radius,
                    radius, -M_PI/2.0, M_PI, 1); //Top Left Radius
    
    CGContextAddLineToPoint(context, origin.x-width, origin.y-flagHeight-radius); //Bottom Left
    CGContextAddArc(context, origin.x-width+radius, origin.y-flagHeight-radius,
                    radius, M_PI, M_PI/2.0, 1); //Bottom Left Radius
    
    CGContextAddLineToPoint(context, origin.x-flagWidth, origin.y-flagHeight);
    CGContextAddLineToPoint(context, origin.x, origin.y);
    
    CGContextFillPath(context);
    
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1); // Font Color
    
    // Flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    // Now draw the text
    CGContextSelectFont(context, "TrebuchetMS-Italic", fontSize, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetTextPosition(context, self.bounds.size.width*0.07, self.bounds.size.height*0.33);
    CGContextShowText(context, [text UTF8String], strlen([text UTF8String]));
}

@end
