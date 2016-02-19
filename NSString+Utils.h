//
//  NSString+Utils.h
//  Pablo A. Pérez-Martínez
//
//  Created by Pau on 02/07/2014.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(Utils)

/**
 * All the arrays must contain at least one object. If we want to use the same colour or font
 * for all the substrings, then we can just add one object to "fonts" or "colours", first object
 * in the arrays will be the default value.
 */

+ (NSMutableAttributedString *)attributedStringWithStrings:(NSArray <NSString *> *)strings fonts:(NSArray <UIFont *> *)fonts colours:(NSArray <UIColor *> *)colours;

@end
