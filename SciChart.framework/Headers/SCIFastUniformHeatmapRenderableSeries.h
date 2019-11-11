//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIFastUniformHeatmapRenderableSeries.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIColorMap.h"

@class SCIUniformHeatmapSeriesStyle;
@class SCITextureOpenGL;

/**
 * @brief The SCIFastUniformHeatmapRenderableSeries class.
 * @discussion Displays 2D data as a heatmap
 * @remark Designed to work with SCIUniformHeatmapDataSeries as data container
 * @remark For styling provide or customize SCIUniformHeatmapSeriesStyle
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIUniformHeatmapDataSeries
 * @see SCIUniformHeatmapSeriesStyle
 */
@interface SCIFastUniformHeatmapRenderableSeries : SCIRenderableSeriesBase

/**
 * @brief Get or set style for visual customization
 * @see SCIUniformHeatmapSeriesStyle
 */
@property(nonatomic, copy) SCIUniformHeatmapSeriesStyle *style;

/**
 * @brief Gets or sets selected series style
 * @discussion If set to nil selected style is default series style
 */
@property(nonatomic, copy) SCIUniformHeatmapSeriesStyle *selectedStyle;

@property(nonatomic) double minimum;

@property(nonatomic) double maximum;

@property(nonatomic, strong) SCIColorMap *colorMap;

@end

/** @}*/
