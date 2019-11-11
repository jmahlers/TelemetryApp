//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendModifierBase.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIChartModifierBase.h"
#import "SCIThemeableProtocol.h"
#import <UIKit/UIKit.h>
#import "SCIOrientation.h"
#import "SCISourceMode.h"
#import "SCILegendPosition.h"
#import "SCILegendItem.h"

/**
 * Class SCILegendModifier - defines base functionality of legend modifier. e.g Defines a position, generates dataSource, orientation.
 */
__deprecated_msg("This is no longer used as a base class for SCILegendModifier")
@interface SCILegendModifierBase : SCIChartModifierBase <SCIThemeableProtocol>

/**
 * Position on surfaceChart. Default is SCILegendPositionTop|SCILegendPositionLeft.
 * @see SCILegendPosition
 */
@property (nonatomic) SCILegendPosition position;

/**
 * Orientation of content on the legend. Default is SCIOrientationVertical
 * @see SCIOrientation
 */
@property (nonatomic) SCIOrientation orientation;

/**
 * Filtering of which data series legend must be shown on the legend. Default is SCILegendShowSeriesAll.
 * @see SCILegendShowSeries
 */
@property (nonatomic) SCISourceMode sourceMode;

/**
 * Show check boxes. Default is YES.
 */
@property (nonatomic) BOOL showCheckBoxes;

/**
 * Show series marker. Default is YES.
 */
@property (nonatomic) BOOL showSeriesMarkers;

/**
 * Array of SCILegendItem which will be displayed on the legend.
 * @see SCILegendShowSeries
 */
@property (nonatomic) NSArray <SCILegendItem *> *dataSource;

/**
 * The root view of legend.
 */
@property (nonatomic, readonly) UIView *holderLegendView;

/**
 * Preferred max size of holder view for legend. You can limit size of frame for legend view by setting this property. Default CGSize(.0f, .0f) - means holder view will have max size equal to chartsurface view size.
 */
@property (nonatomic) CGSize preferredMaxSize;

/**
 * @abstract Call the init for setting default position and orientation of the LegendView.
 * @param position - defines a position of legend on chart surface, if it is set in SCILegendPositionNone, the legend will not be placed on chart surface.
 * @param orientation - defines orientation of content on the legend.
*/
- (instancetype)initWithPosition:(SCILegendPosition)position andOrientation:(SCIOrientation)orientation;

/**
 * Call the method when need to define new location for the holderLegendView on the chart surface. It can be helpfull when you change size of the holderLegendView.
 */
- (void)layoutPositionOfHolderView;

/**
 * Method is called internal every time when modifier needs for new dataSource. So the method can be overrided if you want to generate your own data source. Don't forget to set generated datasource into @property (nonatomic) NSArray <SCILegendItem *> *dataSource
 */
- (void)generateDataSourceAndSetDataSource;

@end

/** @}*/
