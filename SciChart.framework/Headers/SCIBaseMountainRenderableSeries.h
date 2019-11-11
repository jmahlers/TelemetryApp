//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBaseMountainRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIThemeableProtocol.h"

@class SCIMountainSeriesStyle;
@protocol SCIBrushStyleProtocol;
@protocol SCIMountainRenderableSeriesAnimationProtocol;

@interface SCIBaseMountainRenderableSeries : SCIRenderableSeriesBase <SCIThemeableProtocol>

/**
 * @brief Get or set style for visual customization
 * @see SCIMountainSeriesStyle
 */
@property(nonatomic, copy) SCIMountainSeriesStyle *style;

/**
 * @brief Gets or sets selected series style
 * @discussion If set to nil selected style is default series style
 */
@property(nonatomic, copy) SCIMountainSeriesStyle *selectedStyle;

@property(nonatomic) BOOL isDigitalLine;

@property(nonatomic, strong) id <SCIBrushStyleProtocol> areaStyle;

/**
 Make the series animatable. After adding animation and then change data series of the renderable series make new data appear with animation.
 It is not thread safe method. It should be called only from main thread.
 @code
 renderableSeries.addAnimation(SCIScaleRenderableSeriesAnimation(duration: 5, curveAnimation: SCIAnimationCurveEaseOut))
 renderableSeries.dataSeries = newDataSeries
 @endcode
 @param animation some base animation object which implements SCIMountainRenderableSeriesAnimationProtocol.
 */
- (void)addAnimation:(id<SCIMountainRenderableSeriesAnimationProtocol>)animation;

@end
/** @}*/
