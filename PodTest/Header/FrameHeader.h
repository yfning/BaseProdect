
//
//  FrameHeader.h
//  PodTest
//
//  Created by nyf on 2017/12/24.
//  Copyright © 2017年 RT. All rights reserved.
//

#ifndef FrameHeader_h
#define FrameHeader_h

/*
 iPhone4做原型时，可以用320*480,
 iPhone5做原型时，可以用320*568,
 iPhone6做原型时，可以用375*667,
 iPhone6 Plus原型，可以用414x736,
 iPhone X原型，可以用375*812
 */
//屏幕高度、宽度
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width

#define FITWidth_320(width)  (width*MainScreenWidth/320.0)
#define FITHeight_568(height)  (height*MainScreenHeight/568.0)

#define FITWidth_375(width)  (width*MainScreenWidth/375.0)
#define FITHeight_667(height)  (height*MainScreenHeight/667.0)

#define FITWidth_414(width)  (width*MainScreenWidth/414.0)
#define FITHeight_736(height)  (height*MainScreenHeight/736.0)


#define Frame_Line_Color 123
// 状态栏高度
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define STATUS_BAR_HEIGHT ((iPhoneX) ? 44.f : 20.f)
// 导航栏高度
#define k_NavigationHeight ((iPhoneX) ? 88.f : 64.f)
// tabBar高度
#define k_TabbarHeight ((iPhoneX ) ? (49.f+34.f) : 49.f)

#define k_Custom_TabbarHeight (49.f)

// home indicator
#define HOME_INDICATOR_HEIGHT ((iPhoneX ) ? 34.f : 0.f)

#define MainOrigain_Height (MainScreenHeight - k_TabbarHeight - k_NavigationHeight)

#define BottomOrigain_Y (MainScreenHeight - k_TabbarHeight)




#endif /* FrameHeader_h */
