//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIErrorBarsSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIPenStyle;

/**
 * The class provide settings of style for Error bars. It is used in class SCIFastFixedErrorBarsRenderableSeries.
 * @see SCIFastFixedErrorBarsRenderableSeries
 * @see SCIStyle
 */
@interface SCIErrorBarsSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @brief The SCIErrorBarsSeriesStyle class' property.
 * @discussion Defines Line's Pen.
 * @code
 * errorBarStyle.linePen = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 */
@property (nonatomic, strong) SCIPenStyle * strokeStyle;

/**
 * Parameter of drawing line for high limit of error bar.
 * @see SCIFastFixedErrorBarsRenderableSeries
 * @code
 * errorBarStyle.highPen = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 */
@property (nonatomic, strong) SCIPenStyle * strokeHighStyle;

/**
 * Parameter of drawing line for low limit of error bar.
 * @see SCIFastFixedErrorBarsRenderableSeries
 * @code
 * errorBarStyle.lowPen = SCIPenSolid(colorCode: 0xFF00FF00, width: 1)
 * @encode
 */
@property (nonatomic, strong) SCIPenStyle * strokeLowStyle;

@end

/** @} */
