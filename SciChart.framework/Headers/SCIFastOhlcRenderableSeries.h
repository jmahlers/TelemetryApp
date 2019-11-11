//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIFastOhlcRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup RenderableSeries
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIRenderableSeriesBase.h"
#import "SCIThemeableProtocol.h"
#import "SCIOhlcRenderableSeriesAnimationProtocol.h"

@class SCIOhlcSeriesStyle;

/**
 * @brief The SCIFastOhlcRenderableSeries class.
 * @discussion Provides Open-High-Low-Close series rendering where each data point displayed as vertical line from high to low value with marks at open and close values.
 * @discussion OHLC series has two color schemes for Up and Down mode. If open value is higher than close, data point is drawn in Down mode, else in Up mode
 * @remark Designed to work with SCIOhlcDataSeries as data container
 * @remark For styling provide or customize SCIOhlcSeriesStyle
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIOhlcDataSeries
 * @see SCIOhlcSeriesStyle
 */
@interface SCIFastOhlcRenderableSeries : SCIRenderableSeriesBase <SCIThemeableProtocol>

/**
 * @brief Get or set style for visual customization
 * @see SCIOhlcSeriesStyle
 */
@property(nonatomic, copy) SCIOhlcSeriesStyle *style;

/**
 * @brief Gets or sets selected series style
 * @discussion If set to nil selected style is default series style
 */
@property(nonatomic, copy) SCIOhlcSeriesStyle *selectedStyle;

@property(nonatomic) SCIPenStyle *strokeUpStyle;

@property(nonatomic) SCIPenStyle *strokeDownStyle;

@property(nonatomic) double dataPointWidth;

/**
 Make the series animatable. After adding animation and then change data series of the renderable series make new data appear with animation.
 It is not thread safe method. It should be called only from main thread.
 @code
 renderableSeries.addAnimation(SCIScaleRenderableSeriesAnimation(duration: 5, curveAnimation: SCIAnimationCurveEaseOut))
 renderableSeries.dataSeries = newDataSeries
 @endcode
 @param animation some base animation object which implements SCIOhlcRenderableSeriesAnimationProtocol.
 */
- (void)addAnimation:(id<SCIOhlcRenderableSeriesAnimationProtocol>)animation;

@end

/** @}*/
