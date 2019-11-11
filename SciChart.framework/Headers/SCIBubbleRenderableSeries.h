//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBubbleRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIRenderableSeriesBase.h"

@class SCIBubbleSeriesStyle;
@class SCIBrushStyle;
@protocol SCIBubbleRenderableSeriesAnimationProtocol;

static const float max_bubble_size_in_pixel = 100.f; //Using for autoZRange property.

/**
 * @brief The SCIBubbleRenderableSeries class.
 * @discussion Every data point in this renderable series has XYZ data and displayed as buble with position at XY and radius defined by Z value
 * @remark Designed to work with SCIXyzDataSeriesProtocol as data container
 * @remark For styling provide or customize SCIBubbleSeriesStyle
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIXyzDataSeriesProtocol
 * @see SCIBubbleSeriesStyle
 */
@interface SCIBubbleRenderableSeries : SCIRenderableSeriesBase

/**
 * @brief Get or set style for visual customization
 * @see SCIBubbleSeriesStyle
 */
@property(nonatomic, copy) SCIBubbleSeriesStyle *style;

/**
 * @brief Gets or sets selected series style
 * @discussion If set to nil selected style is default series style
 */
@property(nonatomic, copy) SCIBubbleSeriesStyle *selectedStyle;

/**
 * @brief Get or set bubble scale
 * @discussion If autoZrange is NO, Z value multiplied by zScale is bubble radius in pixels
 */
@property(nonatomic) double zScaleFactor;

/**
 * @brief Get or Set auto range for Z. Default is NO. If value is YES Max Z value uses max_bubble_size_in_pixel for defining size of radius.
 */
@property(nonatomic) BOOL autoZRange;

@property(nonatomic) SCIBrushStyle *bubbleBrushStyle;

/**
 Make the series animatable. After adding animation and then change data series of the renderable series make new data appear with animation.
 It is not thread safe method. It should be called only from main thread.
 @code
 renderableSeries.addAnimation(SCIScaleRenderableSeriesAnimation(duration: 5, curveAnimation: SCIAnimationCurveEaseOut))
 renderableSeries.dataSeries = newDataSeries
 @endcode
 @param animation some base animation object which implements SCIBubbleRenderableSeriesAnimationProtocol.
 */
- (void)addAnimation:(id<SCIBubbleRenderableSeriesAnimationProtocol>)animation;

@end

/** @}*/
