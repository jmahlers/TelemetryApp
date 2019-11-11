//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// UIColor+SCIConvertToHexColorCode.h is part of SCICHART®, High Performance Scientific Charts
// For full terms and conditions of the license, see http://www.scichart.com/scichart-eula/
//
// This source code is protected by international copyright law. Unauthorized
// reproduction, reverse-engineering, or distribution of all or any portion of
// this source code is strictly prohibited.
//
// This source code contains confidential and proprietary trade secrets of
// SciChart Ltd., and should at no time be copied, transferred, sold,
// distributed or made available without express written permission.
//******************************************************************************

#import <UIKit/UIKit.h>

// color code has format AABBGGRR
@interface UIColor (SCIConvertToHexColorCode)

/**
 @brief Create UIColor from hex color code. Color code bytes order is 0xAABBGGRR
 */
+(UIColor *) fromABGRColorCode:(uint)color;

/**
 @brief Create UIColor from hex color code. Color code bytes order is 0xAARRGGBB
 */
+(UIColor *) fromARGBColorCode:(uint)color;

/**
 @brief Swap bytes from ARGB into ABGR.
 */
+(uint) swapBytesFromARGBIntoABGR:(uint)argb;

/**
 @brief Get hex color code from UIColor. Color code bytes order is 0xAABBGGRR
 */
-(uint) colorABGRCode;

/**
 @brief Get hex color code from UIColor. Color code bytes order is 0xAARRGGBB
 */
-(uint) colorARGBCode;



@end
