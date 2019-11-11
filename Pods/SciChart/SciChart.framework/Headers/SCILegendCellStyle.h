//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendCellStyle.h is part of SCICHART®, High Performance Scientific Charts
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

#import <UIKit/UIKit.h>

/**
 * The class allows editng style of default cell. New instance of SCILegendCellStyle should be set into property styleOfItemCell of SCILegendCollectionModifier instance.
 * @see SCILegendCollectionModifier
 */
__deprecated_msg("Please use custom ctor of SCILegendDataSource which takes legendItemXibName as a parameter which will be used as fully customized legend item.")
@interface SCILegendCellStyle : NSObject

/**
 * Font name for seriesNameLabel on SCILegendCell. Default is [UIFont fontWithName:@"Helvetica" size:18.f]
 * @see SCILegendCell
 */
@property (nonatomic) UIFont *seriesNameFont;

/**
 * Text color for seriesNameLabel on SCILegendCell. Default is [UIColor darkTextColor]
 * @see SCILegendCell
 */
@property (nonatomic) UIColor *seriesNameTextColor;

/**
 * The image is used for checkBoxButton of SCILegendCell instance for UIControlStateSelected. Default is [UIImage imageNamed:@"checked_checkbox"]
 * @see SCILegendCell
 */
@property (nonatomic) UIImage *checkedBoxImage;

/**
 * The image is used for checkBoxButton of SCILegendCell instance for UIControlStateNormal. Default is [UIImage imageNamed:@"unchecked_checkbox"]
 * @see SCILegendCell
 */
@property (nonatomic) UIImage *uncheckedBoxImage;

/**
 * Border width of markerView of SCILegendCell instance. Default is 0.5f
 * @see SCILegendCell
 */
@property (nonatomic) CGFloat borderWidthMarkerView;

/**
 * Border color of markerView of SCILegendCell instance. Default is [UIColor whiteColor]
 * @see SCILegendCell
 */
@property (nonatomic) UIColor *borderColorMarkerView;

/**
 * Corner radius of markerView of SCILegendCell instance. Default is 5.0f
 * @see SCILegendCell
 */
@property (nonatomic) CGFloat cornerRadiusMarkerView;

/**
 * Size of markerView of SCILegendCell instance. Default is CGSizeMake(15.0f, 15.0f)
 * @see SCILegendCell
 */
@property (nonatomic) CGSize sizeMarkerView;

@end

/** @}*/
