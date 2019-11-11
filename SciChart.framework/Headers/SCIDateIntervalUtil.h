//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDateIntervalUtil.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * Helper class for work with date intervals
 */
@interface SCIDateIntervalUtil : NSObject

/**
 * The days in year
 */
+ (double)daysInYear;

/**
 * The days in month
 */
+ (double)daysInMonth;

/**
 * Gets interval from value in minutes.
 * @param minutes The value in minutes.
 * @return The date interval.
 */
+ (double)fromMinutes:(double)minutes;

/**
 * Gets interval from value in hours.
 * @param hours The value in hours.
 * @return The date interval.
 */
+ (double)fromHours:(double)hours;

/**
 * Gets interval from value in days.
 * @param days The value in days.
 * @return The date interval.
 */
+ (double)fromDays:(double)days;

/**
 * Gets interval from value in weeks.
 * @param weeks The value in weeks.
 * @return The date interval.
 */
+ (double)fromWeeks:(double)weeks;

/**
 * Gets interval from value in months.
 * @param months The value in months.
 * @return The date interval.
 */
+ (double)fromMonths:(double)months;

/**
 * Gets interval from value in years.
 * @param years The value in years.
 * @return The date interval.
 */
+ (double)fromYears:(double)years;

@end
