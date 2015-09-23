//
//  NSString+Utils.h
//  Pablo A. Pérez-Martínez
//
//  Created by Pau on 02/07/2014.
//  Copyright (c) 2014 Pablo A. Pérez-Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(Utils)

/**
 * Makes a part of a string smaller
 * @param string Full string
 * @param substring Substring to change the font
 */
+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring;

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring substringSize:(CGFloat)substringSize;

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring substringFont:(UIFont *)substringFont;

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string stringFont:(UIFont *)stringFont substring:(NSString *)substring substringFont:(UIFont *)substringFont;

+ (CGFloat)heightForText:(NSString *)text labelWidth:(float)labelWidth font:(UIFont *)font;

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords fontName:(NSString *)fontName fontSize:(CGFloat)fontSize;

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords font:(UIFont *)font;

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords font:(UIFont *)font color:(UIColor *)color;

+ (NSAttributedString *)textAsLink:(NSDictionary *)keysAndUrls completeText:(NSString *)completeText;

+ (NSAttributedString *)textAsLink:(NSDictionary *)keysAndUrls completeText:(NSString *)completeText preventPrefixes:(NSArray *)prefixes;

@end
