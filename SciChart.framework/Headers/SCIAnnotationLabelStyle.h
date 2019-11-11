//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAnnotationLabelStyle.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIStyleProtocol.h"
#import "SCIAnnotationStyleEnums.h"
#import "SCITextFormattingStyle.h"

typedef NS_ENUM(NSUInteger, SCILabelPlacement) {
    SCILabelPlacement_Left,
    SCILabelPlacement_TopLeft,
    SCILabelPlacement_BottomLeft,
    SCILabelPlacement_Right,
    SCILabelPlacement_TopRight,
    SCILabelPlacement_BottomRight,
    SCILabelPlacement_Bottom,
    SCILabelPlacement_Top,
    SCILabelPlacement_Axis,
    SCILabelPlacement_Auto
};

/**
 * @abstract block which is used for additional label view setup
 * @discussion this block will be called after all other style options applied
 */
typedef void (^SCIAnnotationLabelSetupBlock) (UILabel * label);

@interface SCIAnnotationLabelStyle : NSObject <SCIStyleProtocol>

/**
 * Changes border width of label. Default is 0.0f.
 */
@property (nonatomic) float borderWidth;
/**
 * Changes corner radius of label. Default is 2.0f.
 */
@property (nonatomic) float cornerRadius;
/**
 * Changes opacity of background. Default is 0.7f.
 */
@property (nonatomic) float backgroundOpacity;

/**
 * Defines distance in pixels from label view border to text
 */
@property (nonatomic) float contentPadding;

@property (nonatomic) float alignmentMargin;

/**
 * Changes background colour of label.
 */
@property (nonatomic, strong) UIColor * backgroundColor;
/**
 * Changes border colour of label
 */
@property (nonatomic, strong) UIColor * borderColor;

/**
 * @abstract This block is used for additional customization of toltip view
 * @discussion Type: typedef void (^SCITooltipViewSetupBlock) (SCITooltipView * view);
 * @see SCITooltipViewSetupBlock
 */
@property (nonatomic, copy) SCIAnnotationLabelSetupBlock labelSetup;

/**
 * @abstract Defines label text formatting style.
 * @discussion Contains properties for customization of labels font, color etc.
 * @see SCITextFormattingStyle
 */
@property (nonatomic, strong) SCITextFormattingStyle * textStyle;

@property (nonatomic) SCILabelPlacement labelPlacement;

@end

/** @}*/
