//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIOhlcSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Themes
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCICallbackBlock.h"
#import "SCIStyleProtocol.h"

//@class SCIPenStyle;
@class SCIPenStyle;

/**
 * @brief The SCIOhlcSeriesStyle class.
 * @discussion Provides styling capabilities for SCIFastOhlcRenderableSeries within SciChart.
 * @see SCIFastOhlcRenderableSeries
 */
@interface SCIOhlcSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

// TODO: reaname wick to week!!!

/**
 * @brief defines week pen for chart Up mode (open < close)
 * @code
 * style.upWickPen = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle *strokeUpStyle;

/**
 * @brief defines week pen for chart Down mode (open > close)
 * @code
 * style.downWickPen = SCIPenSolid(colorCode: 0xFF0000FF, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle *strokeDownStyle;

/**
 * @brief relative width of marker for data point
 * @discussion Valid values are from 0 to 1, where 0 - no body, 1 - no space between data points
 * @discussion Default value is 0.7
 */
@property (nonatomic) double dataPointWidth;

@end

/** @} */
