//
//  AccessGlyphsViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/13.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "AccessGlyphsViewController.h"

@interface AccessGlyphsViewController ()

@end

@implementation AccessGlyphsViewController
- (IBAction)accessGlyphs:(id)sender {
    NSLayoutManager *layoutManager = self.textView.layoutManager;
    NSRange glyphsRange = [layoutManager glyphRangeForTextContainer:self.textView.textContainer];
    NSInteger length = glyphsRange.length;
    CGGlyph glyphs[length];
    NSGlyphProperty properties[length];
    NSUInteger indexes[length];
    unsigned char bidiLevels[length];
    NSUInteger glyphsCount = [layoutManager getGlyphsInRange:glyphsRange glyphs:glyphs properties:properties characterIndexes:indexes bidiLevels:bidiLevels];
    
    NSLog(@"range:%@,count:%ld, length:%ld", NSStringFromRange(glyphsRange), glyphsCount, length);
    
    for (int i = 0; i < length; i++) {
        CGGlyph glyph = glyphs[i];
        NSGlyphProperty property = properties[i];
        NSUInteger index = indexes[i];
        unsigned char bidiLevel = bidiLevels[i];
        NSLog(@"\nglyph:%d, property:%ld, index:%ld, bidiLevel:%hhu", glyph, property, index, bidiLevel);
        
//        glyph = [layoutManager glyphAtIndex:index];
//        NSLog(@"glyph:%d", glyph);
    }
//    CGGlyph glyph = [layoutManager glyphAtIndex:30];
//    NSLog(@"glyph:%d", glyph);
    BOOL isVaild = NO;
    CGGlyph glyph = [layoutManager glyphAtIndex:30 isValidIndex:&isVaild];
    NSLog(@"glyph:%d, isValid:%d", glyph, isVaild);
    isVaild = [layoutManager isValidGlyphIndex:10];
    NSGlyphProperty glyphProperty = [layoutManager propertyForGlyphAtIndex:10];
    glyphsCount = [layoutManager numberOfGlyphs];
    NSInteger glyphIndex = [layoutManager glyphIndexForCharacterAtIndex:0];
    NSInteger charIndex = [layoutManager characterIndexForGlyphAtIndex:19];
    NSLog(@"isVaild:%d, glyphProperty:%ld, glyphsCount:%ld, glyphIndex:%ld, charIndex:%ld", isVaild, glyphProperty, glyphsCount, glyphIndex, charIndex);
//    CGGlyph setGlyphs = {glyphs[0]};
//    NSGlyphProperty setProperties = {NSGlyphPropertyNull};
//    const NSUInteger setIndexes = {0};
//    UIFont *font = [UIFont systemFontOfSize:30];
//    [layoutManager setGlyphs:&setGlyphs properties:&setProperties characterIndexes:&setIndexes font:font forGlyphRange:NSMakeRange(0, 1)];
    

    
}
@end
