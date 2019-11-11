//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDateLabelFormatter.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCILabelFormatterProtocol.h"

/**
 * Defines a default label formatter which is used by `SCIDateTimeLabelProvider`.
 */
@interface SCIDateLabelFormatter : NSObject<SCILabelFormatterProtocol>

/**
 * Creates a new instance of `SCIDateLabelFormatter` class.
 * @param locale The `NSLocale` to use by this formatter.
 * @param timeZone The `NSTimeZone` to use by this formatter.
 */
- (instancetype)initWithLocale:(NSLocale * )locale timeZone:(NSTimeZone *)timeZone;

/**
 * Creates a new instance of `SCIDateLabelFormatter` class.
 * @param labelFormatter A `NSDateFormatter` instance which should be used to format axis labels.
 * @param cursorLabelFormatter A `NSDateFormatter` instance which should be used to format cursor labels.
 */
- (instancetype)initWithLabelFormatter:(NSDateFormatter * _Nonnull)labelFormatter cursorLabelFormatter:(NSDateFormatter * _Nonnull)cursorLabelFormatter;

@end
