//
//  JJCtrlConfig.m
//  JJControl
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "JJCtrlConfig.h"
#import <UIKit/UIKit.h>

inline static UIColor* getColorFromHex2(NSString *hexColor)
{
    if (hexColor == nil) {
        return nil;
    }
    
    unsigned int red, green, blue;
    NSRange range;
    hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    //    ZNLog(@"aaaaaa ===== %d,%d,%d",red,green,blue);
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
    //    return [UIColor whiteColor];
}

@implementation JJCtrlConfig


@end
