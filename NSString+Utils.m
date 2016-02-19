//
//  NSString+Utils.m
//  Pablo A. Pérez-Martínez
//
//  Created by Pau on 02/07/2014.
//

#import "NSString+Utils.h"

@implementation NSString(Utils)

+ (NSMutableAttributedString *)attributedStringWithStrings:(NSArray <NSString *> *)strings fonts:(NSArray <UIFont *> *)fonts colours:(NSArray <UIColor *> *)colours
{
    NSAssert(fonts.count > 0 && colours.count > 0, @"Attributes arrays must contain at least one default object");
    
    NSMutableAttributedString *str = [NSMutableAttributedString new];
    
    for(NSString *string in strings) {
        
        NSInteger index = [strings indexOfObject:string];
        UIFont *font = fonts.count > index ? [fonts objectAtIndex:index] : [fonts firstObject];
        UIColor *colour = colours.count > index ? [colours objectAtIndex:index] : [colours firstObject];
        NSDictionary *attributes = @{NSFontAttributeName : font,
                                     NSForegroundColorAttributeName : colour};
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attributes];
        
        [str appendAttributedString:attrStr];
    }
    
    return str;
}

@end
