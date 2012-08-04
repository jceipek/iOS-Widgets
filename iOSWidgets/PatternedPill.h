//
//  PatternedPill.h
//  iOSWidgets
//
//  Created by Julian Ceipek on 8/2/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PatternedPill : CALayer

- (id)initWithTop:(float)top left:(float)left width:(float)width height:(float)height roundLeft:(BOOL)doRoundLeft right:(BOOL)doRoundRight backgroundColor:(CGColorRef)backgroundColor;



@end

CGColorRef bgColor;
BOOL roundLeft;
BOOL roundRight;


