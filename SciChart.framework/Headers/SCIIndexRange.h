//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIIndexRange.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Ranges
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIRangeProtocol.h"

/**
 @brief Index integer range
 @see SCIRangeProtocol
 */
@interface SCIIndexRange : NSObject <SCIRangeProtocol>

/**
 @brief Index range constructor with min and max values. Min and max internaly stored as int
 @param min SCIGenericType min value
 @param max SCIGenericType max value
 @see SCIGenericType
 @code
 let range = SCIIndexRange(min: SCIGeneric(0), max: SCIGeneric(10))
 @endcode
 */
-(id) initWithMin:(SCIGenericType)min Max:(SCIGenericType)max;

@end

/** @}*/
