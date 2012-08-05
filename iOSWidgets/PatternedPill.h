//
//  PatternedPill.h
//  iOSWidgets
//
//  Created by Julian Ceipek on 8/2/12.
//  Copyright (c) 2012 Julian Ceipek. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum {
    pStriped,
    pLadder
} PatternType;

@interface PatternedPill : CALayer

- (id)initWithMiddle:(float)middle left:(float)left width:(float)width height:(float)height roundLeft:(BOOL)doRoundLeft right:(BOOL)doRoundRight backgroundColor:(CGColorRef)backgroundColor pattern:(PatternType)pType;
@end

PatternType patternType;
CGColorRef bgColor;
BOOL roundLeft;
BOOL roundRight;


