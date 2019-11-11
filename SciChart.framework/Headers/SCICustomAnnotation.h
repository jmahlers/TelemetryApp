//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICustomAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIAnchorPointAnnotation.h"

/** \addtogroup Annotations
 *  @{
 */

@class SCICustomAnnotationStyle;

@interface SCICustomAnnotation : SCIAnchorPointAnnotation

/**
 * Gets or sets the X start point
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x1;

/**
 * Gets or sets the Y start point
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y1;

/**
 * Gets or sets the X start point
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x2;

/**
 * Gets or sets the Y start point
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y2;


/**
 * Gets or sets the Content View
 */
@property (nonatomic) UIView* customView;

/**
 * Gets or sets the CustomAnnotation style
 * @discussion The variety of properties can be set here, e.g. resize marker
 * @code
 * @endcode
 * @see SCICustomAnnotationStyle
 */
@property (nonatomic, copy) SCICustomAnnotationStyle * style;

@end

/** @}*/
