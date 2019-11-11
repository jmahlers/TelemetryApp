//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieChartSurface.h is part of SCICHART®, High Performance Scientific Charts
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

#import <UIKit/UIKit.h>
#import "SCIInvalidatableElementProtocol.h"
#include "SCIRenderSurface.h"

@class SCIGestureController;
@class SCIChartModifierCollection;
@class SCIAnnotationCollection;
@class SCIPieLayoutManager;
@class SCIPieRenderableSeriesCollection;
@protocol SCIPieRenderableSeriesProtocol;

/** \addtogroup Visuals
 *  @{
 */

/**
 *  Surface for pie and donut series. Renders series using CoreGraphics
 */
@interface SCIPieChartSurface : UIView <SCIInvalidatableElementProtocol>

@property (nonatomic, weak, nullable) id<SCIRenderSurfaceProtocol> renderSurface;

/**
 *  Collection of renderable series. Can contain pie or donut series.
 *
 * @see SCIPieRenderableSeriesCollection
 */
@property (nonatomic, strong, nonnull) SCIPieRenderableSeriesCollection * renderableSeries;

/**
 * Instance of gesture handler
 * @see SCIGestureController
 */
@property (nonatomic, strong, nonnull) SCIGestureController * gestureController;

/**
 *  Collection of chart modifiers. SCIPieChartSurface works only with Pie modifiers
 *
 * @see SCIChartModifierCollection
 * @see SCIChartModifierProtocol
 */
@property (nonatomic, strong, nonnull) SCIChartModifierCollection *chartModifiers;
@property (nonatomic, strong, nonnull) SCIAnnotationCollection *annotations; // TODO: hide

/**
 * Manager that calculates size for pie and donut series
 * @see SCIPieLayoutManager
 */
@property (nonatomic, strong, nullable) SCIPieLayoutManager * layoutManager;

/**
 * return frame of SciChart surface
 */
-(CGRect)frame;
/**
 * return frame of charts area
 */
-(CGRect)chartFrame;

/**
 * Gets or sets size of hole for first donut series. Hole size in points
 */
@property (nonatomic) float holeRadius;
/**
 * Gets or sets space between pie series in points
 */
@property (nonatomic) float seriesSpacing;
/**
 * Gets or sets distance from chart area border to pie charts in points
 */
@property (nonatomic) float margin;
/**
 * Gets or sets minimum series height which is used if autolayout failed to calculate size
 */
@property (nonatomic) float seriesMinimumHeight;

@end

/** @}*/

