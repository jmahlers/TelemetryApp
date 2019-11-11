//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITextAnnotation.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIAnchorPointAnnotation.h"
#import "SCIGenericType.h"

@class SCITextAnnotationStyle;

@interface SCITextAnnotation : SCIAnchorPointAnnotation

/**
 * Gets or sets the X position of the left top corner of the TextAnnotation
 * @code
 let textAnnotation = SCITextAnnotation()
 textAnnotation.xAxisId = "xAxis"
 textAnnotation.yAxisId = "yAxis"
 textAnnotation.coordMode = .Relative
 textAnnotation.x1 = SCIGeneric(0.7)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType x1;

/**
 * Gets or sets the Y position of the left top corner of the TextAnnotation
 * @code
 let textAnnotation = SCITextAnnotation()
 textAnnotation.xAxisId = "xAxis"
 textAnnotation.yAxisId = "yAxis"
 textAnnotation.coordMode = .Relative
 textAnnotation.y1 = SCIGeneric(0.5)
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic) SCIGenericType y1;

/**
 * Gets or sets the Text of the TextAnnotation
 * @code
 let textAnnotation = SCITextAnnotation()
 textAnnotation.text = "Hello, World"
 * @endcode
 * @see SCIAnnotationCoordMode
 */
@property (nonatomic, copy) NSString * text;

/**
 * Gets or sets the TextAnnotation style
 * @discussion The variety of preperties can be set here, e.g. text color, font family, background color
 * @code
 let textAnnotation = SCITextAnnotation()
 textAnnotation.xAxisId = "xAxis"
 textAnnotation.yAxisId = "yAxis"
 textAnnotation.style.textStyle.fontSize = 18
 textAnnotation.style.textColor = UIColor.whiteColor()
 textAnnotation.style.backgroundColor = UIColor.clearColor()
 chartSurface.annotation = textAnnotation
 * @endcode
 * @see SCITextAnnotationStyle
 */
@property (nonatomic, copy) SCITextAnnotationStyle * style;

/**
 * Gets or sets the UITextView instance of annotation text.
 */
@property (nonatomic) UITextView *textView;

/**
 * Gets or sets Permission to edit text in the text view.
 */
@property (nonatomic) BOOL editableText;

/**
 * Gets or sets Permission to select text in the text view.
 */
@property (nonatomic) BOOL selectableText;

@end

/** @}*/
