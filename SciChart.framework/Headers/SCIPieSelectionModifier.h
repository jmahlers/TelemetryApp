//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPieSelectionModifier.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * @typedef SCIPieSelectionModifierSelectionMode
 * @brief Enum of SCIPieSelectionModifier selection modes
 */
typedef NS_ENUM(NSUInteger, SCIPieSelectionModifierSelectionMode) {
    /** Can be selected only one sector at time. Sector will be deselected on miss */
    SCIPieSelectionModifierSelectionMode_SingleSelectDeselectOnMiss,
    /** Can be selected only one sector at time. Sector will be deselected on double tap */
    SCIPieSelectionModifierSelectionMode_SingleSelectDeselectOnDoubleTap,
    /** Can be selected multiple sectors. Sectors will be deselected on miss */
    SCIPieSelectionModifierSelectionMode_MultiSelectDeselectOnMiss,
    /** Can be selected multiple sectors. Sectors will be deselected on double tap */
    SCIPieSelectionModifierSelectionMode_MultiSelectDeselectOnDoubleTap
};

/**
 * Selection modifier for SCIPieRenderableSeries and SCIDonutRednerableSeries
 */
@interface SCIPieSelectionModifier : SCIGestureModifier

/**
 * Changes selection mode for modifier
 * @see SCIPieSelectionModifierSelectionMode
 */
@property (nonatomic) SCIPieSelectionModifierSelectionMode selectionMode;

@end

/** @}*/
