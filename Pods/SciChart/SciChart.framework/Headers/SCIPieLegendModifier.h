//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieLegendModifier.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup ChartModifiers
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIChartModifierBase.h"
#import "SCIThemeableProtocol.h"
#import "SCIChartLegend.h"
#import "SCILegendDataSource.h"
#import "SCISourceMode.h"
#import "SCILegendPosition.h"
#import "SCIPieRenderableSeriesProtocol.h"

/**
 * Defines a custom chart modifier which shows a Legend on the `SCIPieChartSurface` and also can provide a data-source via `SCILegendModifier#sourceMode` property.
 */
@interface SCIPieLegendModifier : SCIChartModifierBase<SCIThemeableProtocol>

/**
 *  Gets or sets the position of the current `SCILegendModifier` instance.
 */
@property (nonatomic) SCILegendPosition position;

/**
 *  Gets or sets the orientation of the current `SCILegendModifier` instance.
 */
@property (nonatomic) SCIOrientation orientation;

/**
 * Gets or sets whether the legend should be displayed.
 */
@property (nonatomic) BOOL showLegend;

/**
 * Gets or sets whether the legend should display checkboxes.
 */
@property (nonatomic) BOOL showCheckBoxes;

/**
 * Gets or sets whether the legend should display series markers.
 */
@property (nonatomic) BOOL showSeriesMarkers;

/**
 * Gets or sets the `SCISourceMode` value for legend.
 */
@property (nonatomic) SCISourceMode sourceMode;

/**
 Pie or donut renderable series which sectors Legend displays
 @see SCIPieRenderableSeriesProtocol
 */
@property (nonatomic, weak) id<SCIPieRenderableSeriesProtocol> pieSeries __deprecated_msg("Please use sourceSeries instead");

/**
 * Pie or donut renderable series which segments `SCIPieLegendModifier` used as dataSource.
 */
@property (nonatomic, weak) id<SCIPieRenderableSeriesProtocol> sourceSeries;

/**
 * Creates a new instance of `SCILegendModifier` class.
 * @param legend The `SCIChartLegend` instance which should be used by this modifier.
 */
- (instancetype)initWithLegend:(SCIChartLegend *)legend;

/**
 * Creates a new instance of `SCILegendModifier` class.
 *
 * @param legend The `SCIChartLegend` instance which should be used by this modifier.
 * @param dataSource The `SCILegendDataSource` instance which should be used by legend.
 * @param useAutoPlacement If true modifier will try to place legend inside chart, otherwise legend is already placed somewhere and shouldn't be moved.
 */
- (instancetype)initWithLegend:(SCIChartLegend *)legend dataSource:(SCILegendDataSource *)dataSource useAutoPlacement:(BOOL)useAutoPlacement;

@end

/** @}*/
