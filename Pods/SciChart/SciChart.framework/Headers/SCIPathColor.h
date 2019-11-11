//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPathColor.h is part of SCICHART®, High Performance Scientific Charts
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

@class UIColor;

/**
 @brief Protocol provides basic methods for SciChart brushes.
 @remark For all brushes color code bytes order is 0xAABBGGRR
* @extends NSCopying
 */
@protocol SCIPathColorProtocol ///
 <NSObject, NSCopying>
/** @{ @} */

@required
/**
 @brief Returns color of brush. Can be not valid for textured brushes
 */
-(UIColor*) color;

/**
 @brief Returns color code of brush. Can be not valid for textured brushes. Color code bytes order is 0xAABBGGRR
 */
-(unsigned int) colorCode;
/**
 @brief Returns color code of brush for specific coordinates. Can be not valid for textured brushes. Color code bytes order is 0xAABBGGRR
 */
-(unsigned int) colorCodeAtX:(double)x Y:(double)y;

@end