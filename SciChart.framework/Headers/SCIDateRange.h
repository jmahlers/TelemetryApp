//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDateRange.h is part of SCICHART®, High Performance Scientific Charts
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
 @brief Date time range
 @see SCIRangeProtocol
 */
@interface SCIDateRange : NSObject <SCIRangeProtocol>

/**
 @brief Date time range constructor with min and max values. Min and max internaly stored as NSDate
 @param min SCIGenericType min value
 @param max SCIGenericType max value
 @see SCIGenericType
 @code
 let range = SCIDateRange(min: SCIGeneric(NSDate()), max: SCIGeneric(NSDate()))
 @endcode
 */
-(id) initWithMin:(SCIGenericType)min Max:(SCIGenericType)max;
/**
 @brief Date time range constructor with min and max values. Min and max internaly stored as NSDate
 @param min NSDate min value
 @param max NSDate max value
 @code
 let range = SCIDateRange(dateMin: NSDate(), max: NSDate())
 @endcode
 */
-(id) initWithDateMin:(NSDate*)min Max:(NSDate*)max;

@end

/** @}*/
