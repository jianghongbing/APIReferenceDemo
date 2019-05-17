//
//  LayoutManagerTwo.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/17.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "LayoutManagerTwo.h"
@interface LayoutManagerTwo()
@end
@implementation LayoutManagerTwo
- (instancetype)init {
    self = [super init];
    if (self) {
        _textDrawOrigin = CGPointZero;
    }
    return self;
}

- (void)setTextDrawOrigin:(CGPoint)textDrawOrigin {
    if (CGPointEqualToPoint(textDrawOrigin, _textDrawOrigin)) return;
    _textDrawOrigin = textDrawOrigin;
    [self setNeedsDraw];
}

- (void)setNeedsDraw {
    NSRange glyphRange = [self glyphRangeForTextContainer:self.textContainers.firstObject];
    [self invalidateDisplayForGlyphRange:glyphRange];
}


- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin {
//    NSLog(@"glyphRange:%@, origin:%@", NSStringFromRange(glyphsToShow), NSStringFromCGPoint(origin));
    [super drawBackgroundForGlyphRange:glyphsToShow atPoint:self.textDrawOrigin];
//    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:CGPointMake(origin.x + 30, origin.y + 50)];
//    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:origin];
}

- (void)drawGlyphsForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin {
//    NSLog(@"glyphRange:%@, origin:%@", NSStringFromRange(glyphsToShow), NSStringFromCGPoint(origin));
    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:self.textDrawOrigin];
//    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:CGPointMake(origin.x + 30, origin.y + 50)];
//    [super drawGlyphsForGlyphRange:glyphsToShow atPoint:origin];
}

- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
//    NSLog(@"method:%@", NSStringFromSelector(_cmd));
//    [super drawUnderlineForGlyphRange:glyphRange underlineType:underlineVal baselineOffset:baselineOffset lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
    NSLog(@"rect:%@, glyphRange:%@, lineGlyphRange:%@", NSStringFromCGRect(lineRect), NSStringFromRange(glyphRange), NSStringFromRange(lineGlyphRange));
    CGFloat firstPosition = [self locationForGlyphAtIndex: glyphRange.location].x;
    CGFloat lastPosition;
    if (NSMaxRange(glyphRange) < NSMaxRange(lineGlyphRange)) {
        lastPosition = [self locationForGlyphAtIndex: NSMaxRange(glyphRange)].x;
    }
    else {
        NSInteger glyphIndex = NSMaxRange(lineGlyphRange) - 1;
        CGRect lineFragmentRect = [self lineFragmentRectForGlyphAtIndex:glyphIndex effectiveRange:NULL];
        CGRect lineFragmentUsedRect = [self lineFragmentUsedRectForGlyphAtIndex:glyphIndex effectiveRange:NULL];
        NSLog(@"lineFragmentRect:%@, lineFragmentUsedRect:%@", NSStringFromCGRect(lineFragmentRect), NSStringFromCGRect(lineFragmentUsedRect));
        lastPosition = [self lineFragmentUsedRectForGlyphAtIndex:NSMaxRange(glyphRange)-1 effectiveRange:NULL].size.width;
    }
    lineRect.origin.x += firstPosition;
    lineRect.size.width = lastPosition - firstPosition;
    lineRect.origin.x += containerOrigin.x;
    lineRect.origin.y += containerOrigin.y;
    lineRect = CGRectInset(CGRectIntegral(lineRect), .5, .5);
    [[UIBezierPath bezierPathWithRect: lineRect] stroke];
}

- (void)drawStrikethroughForGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
//    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super drawStrikethroughForGlyphRange:glyphRange strikethroughType:strikethroughVal baselineOffset:baselineOffset lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
}

- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color {
    for (int i = 0; i < rectCount; i++) {
        NSLog(@"rect:%@", NSStringFromCGRect(rectArray[i]));
    }
    NSLog(@"charRange:%@, color:%@", NSStringFromRange(charRange), color);
    [super fillBackgroundRectArray:rectArray count:rectCount forCharacterRange:charRange color:color];
}

- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSUInteger)glyphCount font:(UIFont *)font matrix:(CGAffineTransform)textMatrix attributes:(NSDictionary<NSAttributedStringKey,id> *)attributes inContext:(CGContextRef)graphicsContext {
    [super showCGGlyphs:glyphs positions:positions count:glyphCount font:font matrix:textMatrix attributes:attributes inContext:graphicsContext];
}

- (void)strikethroughGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
//    NSLog(@"glyphRange:%@,strikethroughType:%ld, lineRect:%@, lineGlyphRange:%@, containerOrigin:%@", NSStringFromRange(glyphRange), strikethroughVal, NSStringFromCGRect(lineRect), NSStringFromRange(lineGlyphRange), NSStringFromCGPoint(containerOrigin));
    [super strikethroughGlyphRange:glyphRange strikethroughType:strikethroughVal lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
}

- (void)underlineGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin {
//    NSLog(@"glyphRange:%@,underlineType:%ld, lineRect:%@, lineGlyphRange:%@, containerOrigin:%@", NSStringFromRange(glyphRange), underlineVal, NSStringFromCGRect(lineRect), NSStringFromRange(lineGlyphRange), NSStringFromCGPoint(containerOrigin));
    [super underlineGlyphRange:glyphRange underlineType:underlineVal lineFragmentRect:lineRect lineFragmentGlyphRange:lineGlyphRange containerOrigin:containerOrigin];
}


- (void)processEditingForTextStorage:(NSTextStorage *)textStorage edited:(NSTextStorageEditActions)editMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange {
//    NSLog(@"method:%@", NSStringFromSelector(_cmd));
    [super processEditingForTextStorage:textStorage edited:editMask range:newCharRange changeInLength:delta invalidatedRange:invalidatedCharRange];
}

@end
