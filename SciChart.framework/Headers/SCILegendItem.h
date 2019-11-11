//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendItem.h is part of SCICHART®, High Performance Scientific Charts
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
#import <UIKit/UIKit.h>

@protocol SCIRenderableSeriesProtocol;

/**
 * SCILegendItem model of data which will be shown in legend modifier. And those items are generated in SCILegendModifier.
 * @see SCILegendModifier
 */
__deprecated_msg("This is no longer used as a model of data for SCILegendModifier")
@interface SCILegendItem : NSObject

/**
 * MarkerColor - is color of series. Uses in SCILegendCell for background of markerView property.
 * @see SCILegendCell
 */
@property (nonatomic, nullable) UIColor *markerColor;

/**
 * If dataSeries is visible on chartSurface the property will be YES. It is used in SCILegendCell for checking box.
 * @see SCILegendCell
 */
@property (nonatomic) BOOL isVisible;

/**
 * If dataSeries is selected on chartSurface the property will be YES. It is used in SCILegendCell for checking box.
 * @see SCILegendCell
 */
@property (nonatomic) BOOL isSelected;

/**
 * It is used in SCILegendCell for showing markerView or not.
 * @see SCILegendCell
 */
@property (nonatomic) BOOL showMarker;

/**
 * It is used in SCILegendCell for showing checkBoxButton or not.
 * @see SCILegendCell
 */
@property (nonatomic) BOOL showCheckBoxes;

/**
 * It is used in SCILegendCell for showing series name.
 * @see SCILegendCell
 */
@property (nonatomic, nullable) NSString *seriesName;

/**
 * Renderable series which is used for generating data upper. Also the renderable series is used for changing visibility of renderebleSeries on chartSurface.
 * @see SCILegendCell
 */
@property (nonnull, readonly) id<SCIRenderableSeriesProtocol> renderebleSeries;

/**
 * An instance of SCILegendItem should be created by the initializer.
 * @param series is renderebleSeries which sets renderebleSeries property, markerColor, seriesName, isVisible.
 * @see SCILegendCell
 */
- (_Nonnull instancetype)initWithRenderebleSeries:(_Nonnull id<SCIRenderableSeriesProtocol>)series;

@end

/** @}*/
