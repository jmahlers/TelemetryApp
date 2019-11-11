//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIFastMountainRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * @brief The SCIFastMountainRenderableSeries class.
 * @discussion This renderable series displays filled area from zero line to data points with outline (connecting data points) as option
 * @remark Designed to work with SCIXyDataSeries as data container
 * @remark For styling provide or customize SCIMountainSeriesStyle
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIXyDataSeries
 * @see SCIMountainSeriesStyle
 */
@interface SCIFastMountainRenderableSeries : SCIBaseMountainRenderableSeries 

@end

/** @}*/
