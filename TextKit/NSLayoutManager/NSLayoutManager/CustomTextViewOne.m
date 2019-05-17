//
//  CustomTextViewOne.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/17.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "CustomTextViewOne.h"

@implementation CustomTextViewOne

- (void)drawRect:(CGRect)rect {
    NSLog(@"method:%@", NSStringFromSelector(_cmd));
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    NSLayoutManager * layoutManager = self.layoutManager;
//    NSRange glyphRange = [layoutManager glyphRangeForTextContainer:self.textContainer];
//    CGPoint origin = CGPointMake(rect.origin.x + 20, rect.origin.y + 20);
//    [layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:origin];
//    [layoutManager drawBackgroundForGlyphRange:glyphRange atPoint:origin];
//    CGConte
    [super drawRect:rect];
}


@end
