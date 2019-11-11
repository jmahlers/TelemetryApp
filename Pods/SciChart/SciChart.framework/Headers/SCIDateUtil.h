//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDateUtil.h is part of SCICHART®, High Performance Scientific Charts
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

extern const double DateMinSecondsValue;
extern const double DateMaxSecondsValue;

/**
 * Helper class for work with `NSDate` values
 */
@interface SCIDateUtil : NSObject

/**
 * Checks if addition is valid for specified value.
 *
 * @param current The current value to add to.
 * @param delta   The delta value to add.
 * @return True if addition is valid for current value.
 */
- (BOOL)isAdditionValid:(double)current delta:(double)delta;

/**
 * Adds the delta to specified value.
 *
 * @param current The current value.
 * @param delta   The delta value.
 * @return The new value.
 */
- (double)addDelta:(double)current delta:(double)delta;

/**
 * Checks if specified value is divisible by passed interval.
 *
 * @param current      The value to check.
 * @param dateInterval The divider.
 * @return True if value is divisible by date interval.
 */
- (BOOL)isDivisible:(double)current byDelta:(double)dateInterval;

/**
 * Rounds up specified value to date interval.
 *
 * @param current      The value to round up.
 * @param dateInterval The date interval for rounding operation.
 * @return The rounded value.
 */
- (double)roundUp:(double)current dateInterval:(double)dateInterval;

@end
