//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCISeriesSelectionModifier.h is part of SCICHART®, High Performance Scientific Charts
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

typedef NS_ENUM(NSUInteger, SCISelectionModifierSelectionMode) {
    SCISelectionModifierSelectionMode_SingleSelectDeselectOnMiss,
    SCISelectionModifierSelectionMode_SingleSelectDeselectOnDoubleTap,
    SCISelectionModifierSelectionMode_MultiSelectDeselectOnMiss,
    SCISelectionModifierSelectionMode_MultiSelectDeselectOnDoubleTap
};

@interface SCISeriesSelectionModifier : SCIGestureModifier

@property (nonatomic) SCISelectionModifierSelectionMode selectionMode;
@property (nonatomic) SCIHitTestMode hitTestMode;
@property (nonatomic) double hitTestRadius;

@end

/** @}*/
