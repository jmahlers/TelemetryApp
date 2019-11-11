//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICursorModifier.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCICursorModifierStyle;

/**
 * @typedef SCICursorModifierBehaviourEnum
 * @brief Enum defines options for SCICursorModifier reactions on gestures and touches
 * @see SCICursorModifier
 */
typedef NS_ENUM(NSUInteger, SCICursorModifierBehaviourEnum) {
    /** modifier will show on pan gesture and disappear on release */
    SCICursorModifierBehaviour_Default,
    /** annotation will show on touch, move on pan and disappear on release */
    SCICursorModifierBehaviour_ShowOnTouch
};

/**
 @brief The SCICursorModifier class.
 @discussion Provides a cross-hairs (curosr) plus tooltip with X,Y data values under the touch gestures.
 */
@interface SCICursorModifier : SCIGestureModifier <SCIThemeableProtocol>

/**
 @brief The SCICursorModifier class' property.
 @discussion Gets or sets the CursorModifier Style property.
 */
@property (nonatomic, copy) SCICursorModifierStyle * style;

/**
 @brief The SCICursorModifier class' property.
 @discussion A radius used in the method for interpolation.
 */
@property (nonatomic) double hitTestRadius;

/**
 @brief The SCICursorModifier class' property.
 @discussion Defines modifier's reaction on touches and gestures
 @see SCICursorModifierBehaviourEnum
 */
@property (nonatomic) SCICursorModifierBehaviourEnum behaviour;

@property (nonatomic) BOOL tooltipInteractionStarted;

-(SCIHitTestInfo) hitTestWithProvider:(__unsafe_unretained id<SCIHitTestProviderProtocol>)provider
                            Location:(CGPoint)location Radius:(double)radius
                              onData:(id<SCIRenderPassDataProtocol>)data
                         hitTestMode:(SCIHitTestMode) hitTestMode;

@end

/** @}*/
