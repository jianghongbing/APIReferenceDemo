//
//  LayoutManagerOne.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/10.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "LayoutManagerOne.h"

@implementation LayoutManagerOne
- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:origin];
}

- (void)drawGlyphsForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:origin];
}

- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super drawUnderlineForGlyphRange:glyphRange underlineType:underlineVal baselineOffset:baselineOffset lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
}

- (void)drawStrikethroughForGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super drawStrikethroughForGlyphRange:glyphRange strikethroughType:strikethroughVal baselineOffset:baselineOffset lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
}

- (void)processEditingForTextStorage:(NSTextStorage *)textStorage edited:(NSTextStorageEditActions)editMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super processEditingForTextStorage:textStorage edited:editMask range:newCharRange changeInLength:delta invalidatedRange:invalidatedCharRange];
}

@end
