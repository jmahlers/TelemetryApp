//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILineAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Annotations
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIAnnotationBase.h"

@class SCILineAnnotationStyle;

@interface SCILineAnnotation : SCIAnnotationBase

/**
 * Gets or sets the X start point
 * @code
 let lineAnnotation = SCILineAnnotation()
 lineAnnotation.xAxisId = "xAxis"
 lineAnnotation.yAxisId = "yAxis"
 lineAnnotation.coordMode = .RelativeY
 lineAnnotation.x1 = SCIGeneric(1)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x1;

/**
 * Gets or sets the Y start point
 * @code
 let lineAnnotation = SCILineAnnotation()
 lineAnnotation.xAxisId = "xAxis"
 lineAnnotation.yAxisId = "yAxis"
 lineAnnotation.coordMode = .RelativeY
 lineAnnotation.y1 = SCIGeneric(0.05)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y1;

/**
 * Gets or sets the X end point
 * @code
 let lineAnnotation = SCILineAnnotation()
 lineAnnotation.xAxisId = "xAxis"
 lineAnnotation.yAxisId = "yAxis"
 lineAnnotation.coordMode = .RelativeY
 lineAnnotation.x2 = SCIGeneric(1)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x2;

/**
 * Gets or sets the Y end point
 * @code
 let lineAnnotation = SCILineAnnotation()
 lineAnnotation.xAxisId = "xAxis"
 lineAnnotation.yAxisId = "yAxis"
 lineAnnotation.coordMode = .RelativeY
 lineAnnotation.y2 = SCIGeneric(0.95)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y2;

/**
 * Gets or sets the LineAnnotation style
 * @discussion The variety of preperties can be set here, e.g. line width, color, point marker
 * @code
 let lineAnnotation = SCILineAnnotation()
 lineAnnotation.style.linePen = SCIPenSolid(colorCode: 0xFFFF0000, width: 2)
 chartSurface.annotation = lineAnnotation
 * @endcode
 * @see SCILineAnnotationStyle
 */
@property (nonatomic, copy) SCILineAnnotationStyle * style;

@end

/** @}*/
