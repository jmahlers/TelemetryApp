//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisMarkerAnnotationBase.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIAxisMarkerAnnotationStyle;

@interface SCIAxisMarkerAnnotationBase : SCIAnnotationBase

/**
 * Gets or sets the SCIAxisMarkerAnnotationBase  style
 * @discussion The variety of properties can be set here, e.g. text color, background color, margin, etc.
 * @code
 let averageMarker = SCIAxisMarkerAnnotation()
 averageMarker.style.backgroundColor = UIColor.fromABGRColorCode(0xFF00a5ff)
 chartSurface.annotation = averageMarker
 * @endcode
 * @see SCILineAnnotationStyle
 */
@property (nonatomic, copy) SCIAxisMarkerAnnotationStyle * style;

/**
 * Gets the formatted string value of the AxisMarkerAnnotation
 */
@property (nonatomic, copy) NSString * formattedValue;

/**
 * Formats the value of the AxisMarkerAnnotation
 */
-(NSString *) formatValue:(SCIGenericType)value;

-(UITextField *) axisLabel;

-(id<SCIAxis2DProtocol>) currentAxis;

-(void) resetAxis;

-(SCIGenericType)positionOnAxis;

@end

/** @}*/
