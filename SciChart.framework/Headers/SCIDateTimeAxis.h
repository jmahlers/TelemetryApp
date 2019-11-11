//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDateTimeAxis.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCITimeSpanAxisBase.h"

/**
 @brief Axis that represents date time values and provides tools for layout date time data in SciChart
 @see SCITimeSpanAxisBase
 */
@interface SCIDateTimeAxis : SCITimeSpanAxisBase

/**
 * Default text formatting for `SCIDateTimeAxis`
 */
+ (NSString *)defaultTextFormatting;

/**
 @brief Set axis lsbel formatting when visible range is less than one day. Values are formatted with NSDateFormatter
 */
@property (nonatomic, copy) NSString * subDayTextFormatting __deprecated;

/**
 @brief Set axis lsbel formatting when visible range is less than one year. Values are formatted with NSDateFormatter
 */
@property (nonatomic, copy) NSString * subYearTextFormatting __deprecated;

/**
 @brief Set axis lsbel formatting when visible range is more than one day. Values are formatted with NSDateFormatter
 */
@property (nonatomic, copy) NSString * decadesTextFormatting __deprecated;

@end

/** @}*/
