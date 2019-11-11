//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICoreGraphicsPointMarker.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup PointMarkers
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIPointMarkerBase.h"
#import <QuartzCore/QuartzCore.h>

/**
 @typedef SCIPointMarkerCoreGraphicsSetup
 @brief Block that contains core graphics drawing sequence
 @code
 marker.drawingCall = { ( context, area ) in
   CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
   CGContextFillEllipseInRect(context, area);
 }
 @endcode
 */
typedef void (^SCIPointMarkerCoreGraphicsSetup) (CGContextRef context, CGRect area);

/**
 @brief Point marker with drawing based on core graphics commands. It renders core graphics context to texture before drawing
 @see SCIPointMarker
 */
@interface SCICoreGraphicsPointMarker : SCIPointMarkerBase

/**
 @brief Scale of texture for point marker.
 @discussion Default value is NaN, which means that scale is calculated based on UIScreen scale
 @discussion Scale should be greater than 0
 */
@property (nonatomic) float scale;

/**
 @brief Block that contains core graphics drawing sequence
 @code
 marker.drawingCall = { ( context, area ) in
   CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
   CGContextFillEllipseInRect(context, area);
 }
 @endcode
 @see SCIPointMarkerCoreGraphicsSetup
 */
@property (nonatomic, copy) SCIPointMarkerCoreGraphicsSetup drawingCall;

@end

/** @}*/