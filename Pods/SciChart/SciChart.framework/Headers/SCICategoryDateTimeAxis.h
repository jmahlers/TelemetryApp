//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICategoryDateTimeAxis.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIDateTimeAxis.h"

/**
 @brief Axis that represents category values and provides tools for layout category data in SciChart. This implementation maps date time values on category data
 @see SCIDateTimeAxis
 */
@interface SCICategoryDateTimeAxis : SCIDateTimeAxis

/**
 * Default text formatting for `SCICategoryDateTimeAxis`
 */
+ (NSString *)defaultTextFormatting;

@property (nonatomic) double barTimeFrame;

@end

/** @}*/
