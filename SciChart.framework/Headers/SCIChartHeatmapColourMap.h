//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIChartHeatmapColourMap.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIThemeableProtocol.h"
#import "SCIOrientation.h"
#import "SCIColorMap.h"

/**
 * @brief Legend view for heatmap series.
 */
@interface SCIChartHeatmapColourMap : UIView <SCIThemeableProtocol>

/**
 * @brief Fonts of labels.
 */
@property (nonatomic, nonnull) UIFont *font;

/**
 * @brief Text colors of labels.
 */
@property (nonatomic, nonnull) UIColor *textColor;

/**
 * @brief NSNumberFormatter of representing min and max values in labels.
 * @code
 let numberFormatter = NSNumberFormatter.init()
 numberFormatter.minimumFractionDigits = 2
 numberFormatter.maximumFractionDigits = 2
 numberFormatter.minimumIntegerDigits = 1
 numberFormatter.decimalSeparator = "."
 colourMap.textFormat = numberFormatter
 * @endcode
 * @discussion Default format looks like "10.00"
 */
@property (nonatomic, nonnull) NSFormatter *textFormat;

/**
 * @brief Maximum value which is possible on the heatMap.
 * @discussion Default is 10.0
 */
@property (nonatomic) double maximum;

/**
 * @brief Minimum value which is possible on the heatMap.
 * @discussion Default is 1.0
 */
@property (nonatomic) double minimum;

/**
 * @brief Orientation of content on colorMapView.
 * @discussion Default is SCIOrientationVertical
 */
@property (nonatomic) SCIOrientation orientation;

/**
 * @brief Texture with gradient which represent possible values in range of minimum and maximum.
 */
@property (nonatomic, nullable) SCIColorMap *colourMap;

@end
