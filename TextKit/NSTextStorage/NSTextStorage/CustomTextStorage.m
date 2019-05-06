//
//  CustomTextStorage.m
//  NSTextStorage
//
//  Created by pantosoft on 2019/5/6.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "CustomTextStorage.h"

@implementation CustomTextStorage
{
    NSMutableAttributedString * _attributeString;
}



- (instancetype)initWithString:(NSString *)str {
    self = [super init];
    if (self) {
        _attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    }
    return self;
}

- (instancetype)initWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    self = [super init];
    if (self) {
        _attributeString = [[NSMutableAttributedString alloc] initWithString:str attributes:attrs];
    }
    return self;
}

- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr {
    self = [super init];
    if (self) {
        _attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    }
    return self;
}


- (NSString *)string {
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
    return _attributeString.string;
}

- (NSDictionary<NSAttributedStringKey,id> *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range {
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
    return [_attributeString attributesAtIndex:location effectiveRange:range];
}

- (void)setAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range {
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
    [_attributeString setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str {
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
    [_attributeString replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters range:range changeInLength:(NSInteger)str.length - (NSInteger)range.length];
}



//- (void)edited:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
//    [super edited:editedMask range:editedRange changeInLength:delta];
//    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
//}


- (void)processEditing {
    [super processEditing];
    NSLog(@"method:%@ called", NSStringFromSelector(_cmd));
}
@end
