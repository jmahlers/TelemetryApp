//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIBoxAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIBoxAnnotationStyle;

@interface SCIBoxAnnotation : SCIAnnotationBase

/**
 * Gets or sets the X start point
 * @code
 let boxAnn = SCIBoxAnnotation()
 boxAnn.xAxisId = "xAxis"
 boxAnn.yAxisId = "yAxis"
 boxAnn.coordMode = .Relative
 boxAnn.x1 = SCIGeneric(0.25)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x1;

/**
 * Gets or sets the Y start point
 * @code
 let boxAnn = SCIBoxAnnotation()
 boxAnn.xAxisId = "xAxis"
 boxAnn.yAxisId = "yAxis"
 boxAnn.coordMode = .Relative
 boxRed.y1 = SCIGeneric(0.25)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y1;

/**
 * Gets or sets the X end point
 * @code
 let boxAnn = SCIBoxAnnotation()
 boxAnn.xAxisId = "xAxis"
 boxAnn.yAxisId = "yAxis"
 boxAnn.coordMode = .Relative
 boxRed.x2 = SCIGeneric(0.5)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x2;

/**
 * Gets or sets the Y end point
 * @code
 let boxAnn = SCIBoxAnnotation()
 boxAnn.xAxisId = "xAxis"
 boxAnn.yAxisId = "yAxis"
 boxAnn.coordMode = .Relative
 boxRed.y2 = SCIGeneric(0.5)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y2;

/**
 * Gets or sets the BoxAnnotation style
 * @discussion The variety of preperties can be set here, e.g. box fill brush, border pen
 * @code
 let boxAnn = SCIBoxAnnotation()
 boxAnn.xAxisId = "xAxis"
 boxAnn.yAxisId = "yAxis"
 boxAnn.style.fillBrush = SCIBrushSolid(colorCode: 0x301010FF)
 boxAnn.style.borderPen = SCIPenSolid(colorCode: 0xFF0000FF, width: 2)
 chartSurface.annotation = boxAnn
 * @endcode
 * @see SCIBoxAnnotationStyle
 */
@property (nonatomic, copy) SCIBoxAnnotationStyle * style;

@end

/** @}*/
