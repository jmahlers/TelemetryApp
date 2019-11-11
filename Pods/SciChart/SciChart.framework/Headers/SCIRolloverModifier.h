//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRolloverModifier.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * @typedef SCIRolloverModifierBehaviourEnum
 * @brief Enum defines options for SCIRolloverModifier reactions on gestures and touches
 * @see SCIRolloverModifier
 */
typedef NS_ENUM(NSUInteger, SCIRolloverModifierBehaviourEnum) {
    /** modifier will show on pan gesture and disappear on release */
    SCIRolloverModifierBehaviour_Default,
    /** annotation will show on touch, move on pan and disappear on release */
    SCIRolloverModifierBehaviour_ShowOnTouch
};

@class SCIRolloverModifierStyle;

/**
 @brief The SCIRolloverModifier class.
 @discussion Provides a touch gesture hit-test to a chart.
 */
@interface SCIRolloverModifier : SCIGestureModifier <SCIThemeableProtocol>

/**
 @brief The SCIRolloverModifier class' property.
 @discussion Gets or sets the RolloverModifier Style property.
 */
@property (nonatomic, copy) SCIRolloverModifierStyle * style;

/**
 @brief The SCIRolloverModifier class' property.
 @discussion Defines modifier's reaction on touches and gestures
 @see SCIRolloverModifierBehaviourEnum
 */
@property (nonatomic) SCIRolloverModifierBehaviourEnum behaviour;

/**
 @brief The SCIRolloverModifier class' property.
 @discussion A radius used in the method for interpolation.
 */
@property (nonatomic) double hitTestRadius;

@property (nonatomic) BOOL tooltipInteractionStarted;


-(SCIHitTestInfo) hitTestWithProvider:(__unsafe_unretained id<SCIHitTestProviderProtocol>)provider
                            Location:(CGPoint)location Radius:(double)radius
                              onData:(id<SCIRenderPassDataProtocol>)data
                         hitTestMode:(SCIHitTestMode) hitTestMode;

@end

/** @}*/

