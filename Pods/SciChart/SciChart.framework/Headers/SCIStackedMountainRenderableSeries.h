//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIStackedMountainRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIBaseMountainRenderableSeries.h"
#import "SCIStackedRenderableSeries.h"
#import "SCIThemeableProtocol.h"

@class SCIMountainSeriesStyle;

/**
 * @brief The SCIStackedMountainRenderableSeries class.
 * @discussion This renderable series displays data points band starting at zero line or from previous stacked renderable series band
 * @discussion Stacked mountains stacks data vertically. That means that current Y value is summ of Y value and values at the same X of all other stacked mountain series in stacked group that are lower in order
 * @remark Should be used as sub series of SCIStackedGroupSeries
 * @remark Designed to work with SCIXyDataSeries as data container
 * @remark For styling provide or customize SCIMountainSeriesStyle
 * @see SCIStackedRenderableSeriesProtocol
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIXyDataSeriesProtocol
 * @see SCIMountainSeriesStyle
 */
@interface SCIStackedMountainRenderableSeries : SCIBaseMountainRenderableSeries <SCIStackedRenderableSeriesProtocol>

@end

/** @}*/