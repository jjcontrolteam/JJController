//
//  BDUMD5Crypt.m
//  JJControl
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BDUMD5Crypt.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
@implementation BDUMD5Crypt
+ (NSString *)macSignWithText:(NSString *)text secretKey:(NSString *)secretKey{
    CCHmacContext ctx;
    //使用GBK编码
    
    unsigned long encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    const char *key = [secretKey cStringUsingEncoding:encode];
    const char *str = [text cStringUsingEncoding:encode];
    unsigned char mac[CC_MD5_DIGEST_LENGTH];
    char hexmac[2 * CC_MD5_DIGEST_LENGTH + 1];
    char *p;
    CCHmacInit(&ctx, kCCHmacAlgMD5, key, strlen(key));
    CCHmacUpdate(&ctx, str, strlen(str));
    CCHmacFinal(&ctx, mac);
    p = hexmac;
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH;i++) {
        
        snprintf(p,3,"%02x", mac[ i ]);
        
        p += 2;
        
    }
    return [NSString stringWithCString:hexmac encoding:encode];
    
}

@end
