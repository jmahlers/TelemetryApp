//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRenderSurfaceStyle.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Themes
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCICallbackBlock.h"
#import "SCIStyleProtocol.h"

@class SCIPenStyle, SCIBrushStyle;

/**
 * @brief The SCIRenderSurfaceStyle class.
 * @discussion Defines chart surface background colors and axis areas' size
 * @see SCIChartSurfaceProtocol
 */
@interface SCIRenderSurfaceStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * Defines background fill color for surface.
 * @code
 * surface.style.backgroundBrush = SCIBrushSolid(colorCode: 0xFFA0A050)
 * @endcode
 * @see SCIBrush2DProtocol
 */
@property (nonatomic, strong) SCIBrushStyle *backgroundBrush;

/**
 * Defines chart area border thicknes and color.
 * @code
 * surface.style.renderableSeriesAreaBorder = SCIPenSolid(colorCode: 0xFFF0F050, width: 1)
 * @endcode
 * @see SCIPenStyleProtocol
 */
@property (nonatomic, strong) SCIPenStyle *renderableSeriesAreaBorder;

/**
 * Defines background fill color for chart area
 * @code
 * surface.style.renderableSeriesAreaFill = SCIBrushSolid(colorCode: 0xFFA0A050)
 * @endcode
 * @see SCIBrushStyleProtocol
 */
@property (nonatomic, strong) SCIBrushStyle *renderableSeriesAreaFill;

/**
 * Set left axis area size. If set to NAN axis area will be auto resized. Default is NAN
 */
@property (nonatomic) float leftAxisAreaSize;
/**
 * Set right axis area size. If set to NAN axis area will be auto resized. Default is NAN
 */
@property (nonatomic) float rightAxisAreaSize;
/**
 * Set top axis area size. If set to NAN axis area will be auto resized. Default is NAN
 */
@property (nonatomic) float topAxisAreaSize;
/**
 * Set bottom axis area size. If set to NAN axis area will be auto resized. Default is NAN
 */
@property (nonatomic) float bottomAxisAreaSize;

/**
 * For internal use
 */
@property (nonatomic) BOOL supressCallbacks;

/**
 * For internal use
 * @discussion Block executed when axes request resize from surface
 */
@property (nonatomic, copy) SCIActionBlock layoutChanged;

@end

/** @} */
