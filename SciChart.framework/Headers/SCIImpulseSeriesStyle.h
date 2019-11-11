//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIImpulseSeriesStyle.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIPenStyle;
@protocol SCIPointMarkerProtocol;
@class SCIPointMarkerClusterizer;

/**
 * @brief The SCIImpulseSeriesStyle class.
 * @discussion Provides styling capabilities for SCIFastImpulseRenderableSeries within SciChart.
 * @see SCIStyleProtocol
 * @see SCIFastImpulseRenderableSeries
 */
@interface SCIImpulseSeriesStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @brief Defines impulse line color and thickness
 * @code
 * style.linePen = SCIPenSolid(color: UIColor.blueColor(), width: 2)
 * @encode
 * @see SCIPenStyle
 */
@property (nonatomic, strong) SCIPenStyle * strokeStyle;

/**
 * @brief Defines impulse point marker
 * @code
 * let marker = SCIEllipsePointMarker()
 * marker.drawBorder = false
 * marker.fillBrush = SCIBrushSolid(color: UIColor.blueColor())
 * impulseSeries.style.pointMarker = marker
 * @endcode
 * @see SCIPointMarker
 */
@property (nonatomic, strong) id<SCIPointMarkerProtocol> pointMarker;

/**
 * @brief Point marker drawing optimization
 * @discussion For internal use
 * @see SCIPointMarkerClusterizer
 */
@property (nonatomic, strong) SCIPointMarkerClusterizer * cluster;

/**
 * @brief Culling distance of tightly packed point markers
 * @discussion Distance in pixels on screen at which point markers will be culled.
 * @discussion Default value is 2. Bigger value can create noticable gaps, smaller will hit performance
 */
@property (nonatomic) float clusterSpacing;

@end

/** @} */
