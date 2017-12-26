
//
//  FrameHeader.h
//  PodTest
//
//  Created by nyf on 2017/12/24.
//  Copyright © 2017年 RT. All rights reserved.
//

#ifndef FrameHeader_h
#define FrameHeader_h

//屏幕高度、宽度
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width

#define Frame_Line_Color 123
// 状态栏高度
#define STATUS_BAR_HEIGHT ((iPhoneX || IPhoneX_Device_Type) ? 44.f : 20.f)
// 导航栏高度
#define k_NavigationHeight ((iPhoneX || IPhoneX_Device_Type) ? 88.f : 64.f)
// tabBar高度
#define k_TabbarHeight ((iPhoneX || IPhoneX_Device_Type) ? (49.f+34.f) : 49.f)

#define k_Custom_TabbarHeight (49.f)

// home indicator
#define HOME_INDICATOR_HEIGHT ((iPhoneX || IPhoneX_Device_Type) ? 34.f : 0.f)



#endif /* FrameHeader_h */
