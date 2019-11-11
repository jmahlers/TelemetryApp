//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIColumnSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIPenStyle, SCIBrushStyle;

/**
 * @brief The SCIColumnSeriesStyle class.
 * @discussion Provides styling capabilities for SCIFastColumnRenderableSeries within SciChart.
 */
@interface SCIColumnSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @brief defines columns' outline color and thickness
 * @code
 * style.borderPen = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle *strokeStyle;

/**
 * @brief Defines columns' fill color
 * @code
 * style.fillBrush = SCIBrushSolid(colorCode: 0xFFFFFF00)
 * @encode
 * @see SCIBrushStyle
 */
@property (nonatomic, strong) SCIBrushStyle *fillBrushStyle;

/**
 * @brief relative width of column
 * @discussion Valid values are from 0 to 1, where 0 - no body, 1 - no space between columns
 * @discussion Default value is 0.7
 */
@property (nonatomic) double dataPointWidth;

@end

/** @} */
