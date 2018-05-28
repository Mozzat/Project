//
//  ColorAndFont.h
//  jike
//
//  Created by taotingxing on 2018/5/16.
//  Copyright © 2018年 陶庭兴. All rights reserved.
//

#ifndef ColorAndFont_h
#define ColorAndFont_h

///字体颜色
static inline UIColor *greenColor() {
    
    return HexColor(@"5AB497");
    
}

static inline UIColor *organColor(){
    
    return HexColor(@"EEB251");
    
}

static inline UIColor *whiteColor(){
    
    return UIColor.whiteColor;
    
}

static inline UIColor *blackColor() {
    
    return HexColor(@"373737");
    
}

///字号
static inline UIFont *Font36() {
    
    return [UIFont systemFontOfSize:36];
    
}

static inline UIFont *Font26() {
    
    return [UIFont systemFontOfSize:26];
    
}

static inline UIFont *Font18() {
    
    return [UIFont systemFontOfSize:18];
    
}

static inline UIFont *Font16() {
    
    return [UIFont systemFontOfSize:16];
    
}

static inline UIFont *Font15() {
    
    return [UIFont systemFontOfSize:15];
    
}

static inline UIFont *Font14() {
    
    return [UIFont systemFontOfSize:14];
    
}

static inline UIFont *Font12() {
    
    return [UIFont systemFontOfSize:12];
    
}
#endif /* ColorAndFont_h */
