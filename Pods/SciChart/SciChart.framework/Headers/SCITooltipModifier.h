//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITooltipModifier.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup ChartModifiers
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIGestureModifier.h"
#import "SCIHitTestProvider.h"
#import "SCIThemeableProtocol.h"

@class SCITooltipModifierStyle;

/**
 * @typedef SCITooltipModifierBehaviourEnum
 * @brief Enum defines options for SCITooltipModifier reactions on gestures and touches
 * @see SCITooltipModifier
 */
typedef NS_ENUM(NSUInteger, SCITooltipModifierBehaviourEnum) {
    /** modifier will show on pan gesture and disappear on release */
    SCITooltipModifierBehaviour_Default,
    /** annotation will show on touch, move on pan and disappear on release */
    SCITooltipModifierBehaviour_ShowOnTouch
};

/**
 @brief The SCITooltipModifier class.
 @discussion Provides a touch tooltip to a chart, outputting a single SeriesIfo.
 */
@interface SCITooltipModifier : SCIGestureModifier <SCIThemeableProtocol>

/**
 @brief The SCITooltipModifier class' property.
 @discussion Gets or sets the ToolTip Style property.
 */
@property (nonatomic, copy) SCITooltipModifierStyle * style;

/**
 @brief The SCITooltipModifier class' property.
 @discussion A radius used in the method for interpolation.
 */
@property (nonatomic) double hitTestRadius;

/**
 @brief The SCITooltipModifier class' property.
 @discussion Defines modifier's reaction on touches and gestures
 @see SCITooltipModifierBehaviourEnum
 */
@property (nonatomic) SCITooltipModifierBehaviourEnum behaviour;

@property (nonatomic) BOOL tooltipInteractionStarted;

-(SCIHitTestInfo) hitTestWithProvider:(__unsafe_unretained id<SCIHitTestProviderProtocol>)provider
                            Location:(CGPoint)location Radius:(double)radius
                              onData:(id<SCIRenderPassDataProtocol>)data
                         hitTestMode:(SCIHitTestMode) hitTestMode;

@end

/** @}*/
