//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITextAnnotationStyle.h is part of SCICHART®, High Performance Scientific Charts
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

@class UITextView;
@class SCITextFormattingStyle;
@class UIColor;

/**
 * @abstract block which is used for additional text view setup
 * @discussion this block will be called after all other style options applied
 * @param view UITextView in which text is displayed
 */
typedef void (^SCITextAnnotationViewSetupBlock) (UITextView * view);

/**
 * @abstract SCITextAnnotationStyle class
 * @discussion Contains properties for text annotation theming and customization
 * @see SCITextAnnotation
 */
@interface SCITextAnnotationStyle : NSObject <SCIStyleProtocol, NSCopying>

/**
 * @abstract Defines text annotation text formatting style.
 * @discussion Contains properties for customization of labels font, color etc.
 * @see SCITextFormattingStyle
 */
@property (nonatomic, strong) SCITextFormattingStyle * textStyle;

/**
 * @abstract Defines text annotation text color
 */
@property (nonatomic, strong) UIColor * textColor;

/**
 * @abstract Defines text annotation background color
 */
@property (nonatomic, strong) UIColor * backgroundColor;

/**
 * @abstract viewSetup block used for additional customization of text annotation
 * @discussion Type: void (^SCITextAnnotationViewSetupBlock) (UITextField * view)
 * @see SCITextAnnotationViewSetupBlock
 */
@property (nonatomic, copy) SCITextAnnotationViewSetupBlock viewSetup;

@end

/** @}*/
