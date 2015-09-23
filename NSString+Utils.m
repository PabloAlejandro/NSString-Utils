//
//  NSString+Utils.m
//  Pablo A. Pérez-Martínez
//
//  Created by Pau on 02/07/2014.
//  Copyright (c) 2014 Pablo A. Pérez-Martínez. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString(Utils)

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring
{
    if(!string)
        return nil;
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:27.0];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    if([substring length] < 1)
        return str;
    
    @try {
        [str addAttribute:NSFontAttributeName value:font range:[string rangeOfString:substring]];
    }
    @catch (NSException *exception) {
        NSLog(@"%s: Exception -> %@", __func__, exception);
    }
    @finally {
        return str;
    }
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring substringSize:(CGFloat)substringSize
{
    if(!string)
        return nil;
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:substringSize];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    if([substring length] < 1)
        return str;
    
    @try {
        [str addAttribute:NSFontAttributeName value:font range:[string rangeOfString:substring]];
    }
    @catch (NSException *exception) {
        NSLog(@"%s: Exception -> %@", __func__, exception);
    }
    @finally {
        return str;
    }
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string substring:(NSString *)substring substringFont:(UIFont *)substringFont
{
    if(!string)
        return nil;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    if([substring length] < 1)
        return str;
    
    @try {
        [str addAttribute:NSFontAttributeName value:substringFont range:[string rangeOfString:substring]];
    }
    @catch (NSException *exception) {
        NSLog(@"%s: Exception -> %@", __func__, exception);
    }
    @finally {
        return str;
    }
}

+ (NSMutableAttributedString *)attributedStringWithString:(NSString *)string stringFont:(UIFont *)stringFont substring:(NSString *)substring substringFont:(UIFont *)substringFont
{
    if(!string) {
        return nil;
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    
    if([string rangeOfString:string].location == NSNotFound) {
        return nil;
    }
    
    NSRange range = [string rangeOfString:string];
    
    if(str)
        [str addAttribute:NSFontAttributeName value:stringFont range:range];
    
    if([substring length] < 1)
        return str;

    @try {
        [str addAttribute:NSFontAttributeName value:substringFont range:[string rangeOfString:substring]];
    }
    @catch (NSException *exception) {
        NSLog(@"%s: Exception -> %@", __func__, exception);
    }
    @finally {
        return str;
    }
}

+ (CGFloat)heightForText:(NSString *)text labelWidth:(float)labelWidth font:(UIFont *)font
{
    if(!text || labelWidth <= 0 || !font)
        return 0.0f;
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = CGSizeMake(labelWidth, 9999);
    
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize textSize = rect.size;
    
    return textSize.height;
}

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords fontName:(NSString *)fontName fontSize:(CGFloat)fontSize
{
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:self];
    
    UIFont *font = [UIFont fontWithName:[NSString stringWithFormat:@"%@-bold", fontName] size:fontSize];
    
    for (NSString * word in keywords) {
        
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:word options:NSRegularExpressionCaseInsensitive error:nil];
        
        //  enumerate matches
        NSRange range = NSMakeRange(0, [self length]);
        [expression enumerateMatchesInString:self options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            
            NSRange newRange = [result rangeAtIndex:0];
            
            @try {
                [string addAttribute: NSFontAttributeName value:font range: newRange];
            }
            @catch (NSException *exception) {
                NSLog(@"%s %@", __func__, exception);
            }
        }];
    }

    return string;
}

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords font:(UIFont *)font
{
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSString * word in keywords) {
        
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:word options:NSRegularExpressionCaseInsensitive error:nil];
        
        //  enumerate matches
        NSRange range = NSMakeRange(0, [self length]);
        [expression enumerateMatchesInString:self options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            
            NSRange newRange = [result rangeAtIndex:0];
            
            @try {
                [string addAttribute: NSFontAttributeName value:font range: newRange];
            }
            @catch (NSException *exception) {
                NSLog(@"%s %@", __func__, exception);
            }
        }];
    }
    
    return string;
}

- (NSAttributedString *)attributedStringWithKeywords:(NSArray *)keywords font:(UIFont *)font color:(UIColor *)color
{
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:self];
    
    for (NSString * word in keywords) {
        
        NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:word options:NSRegularExpressionCaseInsensitive error:nil];
        
        //  enumerate matches
        NSRange range = NSMakeRange(0, [self length]);
        [expression enumerateMatchesInString:self options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            
            NSRange newRange = [result rangeAtIndex:0];
            
            @try {
                [string addAttribute: NSFontAttributeName value:font range: newRange];
                
                [string addAttribute: NSForegroundColorAttributeName value:color range: newRange];
            }
            @catch (NSException *exception) {
                NSLog(@"%s %@", __func__, exception);
            }
        }];
    }
    
    return string;
}

+ (NSAttributedString *)textAsLink:(NSDictionary *)keysAndUrls completeText:(NSString *)completeText
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:completeText];
    
    for(NSString *key in [keysAndUrls allKeys]) {
        
        NSRange range = [completeText rangeOfString:key options:NSCaseInsensitiveSearch];
        
        if (range.location != NSNotFound) {
            
            [attr addAttribute:NSLinkAttributeName value:[keysAndUrls objectForKey:key] range:range];
            [attr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range];
        }
    }
    
    return attr;
}

+ (NSAttributedString *)textAsLink:(NSDictionary *)keysAndUrls completeText:(NSString *)completeText preventPrefixes:(NSArray *)prefixes
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:completeText];
    
    for(NSString *key in [keysAndUrls allKeys]) {
        
        NSRange range = [completeText rangeOfString:key options:NSCaseInsensitiveSearch];
        
        if (range.location != NSNotFound) {
            
            if(![prefixes containsObject:[completeText substringWithRange:NSMakeRange(MAX(range.location - 1, 0), 1)]]) {
                
                [attr addAttribute:NSLinkAttributeName value:[keysAndUrls objectForKey:key] range:range];
                [attr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range];
            }
        }
    }
    
    return attr;
}

@end
