//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITimeSpanAxisBase.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Axis
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIAxisBase.h"

/**
 @brief Provides base functions for axes that represents date time values and provides tools for layout date time data in SciChart
 @see SCIAxisBase
 */
@interface SCITimeSpanAxisBase : SCIAxisBase

/**
 @brief Method creates visible range valid for SCITimeSpanAxisBase imlementation with provided min and max values
 @discussion Should be implemented in subclass
 @see SCIGenericType
 @see SCIRangeProtocol>
 */
-(id<SCIRangeProtocol>) toVisibleRangeMin:(SCIGenericType)min Max:(SCIGenericType)max;

@end

/** @}*/