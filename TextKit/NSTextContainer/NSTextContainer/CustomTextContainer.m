//
//  CustomTextContainer.m
//  NSTextContainer
//
//  Created by pantosoft on 2019/5/7.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "CustomTextContainer.h"

@implementation CustomTextContainer
- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect {
    
    CGRect rect = [super lineFragmentRectForProposedRect:proposedRect atIndex:characterIndex writingDirection:baseWritingDirection remainingRect:remainingRect];
    CGFloat lineCenterToContainerCenter = fabs(CGRectGetMidY(rect) - self.size.height * 0.5);
    CGFloat lineWidth = rect.size.width - lineCenterToContainerCenter * 0.8;
    CGFloat x = (self.size.width - lineWidth) * 0.5;
    rect.origin.x = x;
    rect.size.width = lineWidth;
    return rect;
}

- (BOOL)isSimpleRectangularTextContainer {
    return NO;
}

@end
