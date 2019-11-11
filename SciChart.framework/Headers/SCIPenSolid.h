//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPenSolid.h is part of SCICHART®, High Performance Scientific Charts
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

#import <Foundation/Foundation.h>
#import "SCIPen2D.h"

/**
 @brief Pen with stroke thickness and solid color
 @see SCIPen2DProtocol
 */
@interface SCIPenSolid : NSObject <SCIPen2DProtocol>

/**
 @brief Constructor creates pen with given color and stroke thickness
 */
-(nonnull instancetype) initWithColor:(nonnull UIColor *)color Width:(float)width;
/**
 @brief Constructor creates pen with given color code and stroke thickness. Color code byte order is 0xAABBGGRR
 */
-(nonnull instancetype) initWithColorCode:(unsigned int)color Width:(float)width;

@end
