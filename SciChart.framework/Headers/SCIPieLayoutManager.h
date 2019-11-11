//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieLayoutManager.h is part of SCICHART®, High Performance Scientific Charts
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

#import <Foundation/Foundation.h>

@class SCIPieChartSurface;

/** \addtogroup Visuals
 *  @{
 */

/**
 Tool for auto layout of Pie and Donut series inside of SCIPieChartSurface
 */
@interface SCIPieLayoutManager : NSObject

/**
 SCIPieChartSurface that uses layout manager to calculate Pie and Donut series layyout
 @see SCIPieChartSurface
 */
@property (nonatomic, weak) SCIPieChartSurface * parentSurface;

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

/**
 Creates intance of layout manager
 @param parentSurface SCIPieChartSurface that uses layout manager to calculate Pie and Donut series layyout
 @see SCIPieChartSurface
 */
-(instancetype)initWithParent:(SCIPieChartSurface*)parentSurface;

/**
 Method is called on request of parent surface. Calculates layout for Pie and Donut series of parent surface
 */
-(void) layoutSeries;

@end

/** @}*/

