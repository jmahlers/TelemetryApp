//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIXyScatterRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

@protocol SCIPointMarkerProtocol, SCIScatterRenderableSeriesAnimationProtocol;
@class SCIScatterSeriesStyle;

/**
 * @brief The SCIXyScatterRenderableSeries class.
 * @discussion This renderable series displays data points as point markers at given cooordinates
 * @remark Designed to work with SCIXyDataSeries as data container
 * @remark For styling provide or customize SCIScatterSeriesStyle
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIXyDataSeries
 * @see SCIScatterSeriesStyle
 */
@interface SCIXyScatterRenderableSeries : SCIRenderableSeriesBase

/**
 * @brief Get or set style for visual customization
 * @see SCIScatterSeriesStyle
 */
@property(nonatomic, copy) SCIScatterSeriesStyle *style;

/**
 * @brief Gets or sets selected series style
 * @discussion If set to nil selected style is default series style
 */
@property(nonatomic, copy) SCIScatterSeriesStyle *selectedStyle;

/**
 Make the series animatable. After adding animation and then change data series of the renderable series make new data appear with animation.
 It is not thread safe method. It should be called only from main thread.
 @code
 renderableSeries.addAnimation(SCIScaleRenderableSeriesAnimation(duration: 5, curveAnimation: SCIAnimationCurveEaseOut))
 renderableSeries.dataSeries = newDataSeries
 @endcode
 @param animation some base animation object which implements SCIScatterRenderableSeriesAnimationProtocol.
 */
- (void)addAnimation:(id<SCIScatterRenderableSeriesAnimationProtocol>)animation;

@end

/** @}*/
