//
//  InterfaceHeader.h
//  PodTest
//
//  Created by nyf on 2017/12/26.
//  Copyright © 2017年 RT. All rights reserved.
//

#ifndef InterfaceHeader_h
#define InterfaceHeader_h

#define ShowBundleID ([BundleID isEqualToString:@"com.cfldcn.MSS.DEV"])

//ShowBundleID > 0 代表是正式环境
#define kRequestHost (ShowBundleID > 0 ? @"http://saleapp.cfldcn.com/service/main.ashx":@"http://wxsaletest.cfldcn.com:8888/service/main.ashx")
#define kImageBaseHost (ShowBundleID > 0 ? @"http://saleapp.cfldcn.com":@"http://wxsaletest.cfldcn.com:8888")

#endif /* InterfaceHeader_h */
