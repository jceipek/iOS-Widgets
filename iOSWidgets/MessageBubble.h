//
//  MessageBubble.h
//  iOSWidgets
//
//  Created by Julian Ceipek on 7/31/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MessageBubble : CALayer

- (id)initWithText:(NSString*)theText originX:(float)x y:(float)y fontSize:(float)theFontSize radius:(float)theRadius;

@end

NSString *text;
float fontSize;
float radius;
