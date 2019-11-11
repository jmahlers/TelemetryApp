//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieTooltipModifier.h is part of SCICHART®, High Performance Scientific Charts
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

#import <Foundation/Foundation.h>
#import "SCIGestureModifier.h"

/** \addtogroup ChartModifiers
 *  @{
 */

@class SCITooltipModifierStyle;
@class SCITooltipView;

/**
 @brief The SCITooltipModifier class.
 @discussion Pop up view on pan gesture with information about segment
 */
@interface SCIPieTooltipModifier : SCIGestureModifier {
@protected
    SCITooltipView * _view;
    BOOL _gestureLocked;
    CGPoint _location;
}

/**
 @brief Method creates pop up view instance
 @discussion Called internally on init.
 @see SCITooltipView
 */
-(SCITooltipView*) createTooltipView;

/**
 @brief The SCITooltipModifier class' property.
 @discussion Gets or sets the ToolTip Style property.
 @see SCITooltipModifierStyle
 */
@property (nonatomic, copy) SCITooltipModifierStyle * style;

@end

/** @}*/
