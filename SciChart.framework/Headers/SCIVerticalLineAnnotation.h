//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIVerticalLineAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCILineAnnotation.h"

/**
 * @typedef SCIVerticalLineAnnotationAlignment
 * @abstract Enumeration constants to define the Vertical Alignment mode used to place an annotation.
 * @discussion Possible values:
 * @discussion - SCIHorizontalLineAnnotationAlignment_Stretch A line stretched to fill the entire scichart surface
 * @discussion - SCIVerticalLineAnnotationAlignment_Bottom A line aligned to the bottom of the scichart surface
 * @discussion - SCIVerticalLineAnnotationAlignment_Top A line aligned to the top of the scichart surface
 * @discussion - SCIVerticalLineAnnotationAlignment_Center A line aligned to the center of the scichart surface
 */
typedef NS_ENUM(NSUInteger, SCIVerticalLineAnnotationAlignment) {
    SCIVerticalLineAnnotationAlignment_Stretch,
    SCIVerticalLineAnnotationAlignment_Bottom,
    SCIVerticalLineAnnotationAlignment_Top,
    SCIVerticalLineAnnotationAlignment_Center,
};


//@class SCIVerticalLineAnnotationStyle;

@class SCILineAnnotationLabel;

@interface SCIVerticalLineAnnotation : SCILineAnnotation

/**
 * Gets the formatted string value of the SCIVerticalLineAnnotation
 */
@property (nonatomic, copy) NSString * formattedValue;


/**
 * Gets or sets the Vertical Alignment for SCIVerticalLineAnnotation
 */
@property (nonatomic) SCIVerticalLineAnnotationAlignment verticalAlignment;

/**
 * Formats the value of the SCIVerticalLineAnnotation
 */
-(NSString *) formatValue:(SCIGenericType)value;

/**
 * Adds SCIAnnotationLabel into SCIHorizontalLineAnnotation's labels collection
 */
-(void) addLabel:(SCILineAnnotationLabel*)label;

/**
 * Removes SCIAnnotationLabel from SCIHorizontalLineAnnotation's labels collection
 */
-(void) removeLabel:(SCILineAnnotationLabel*)label;

/**
 * Gets SCIAnnotationLabel from SCIHorizontalLineAnnotation's labels collection
 */
-(SCILineAnnotationLabel *) labelAt:(int)index;

-(void) removeLabelAt:(int)index;

@end

/** @}*/
