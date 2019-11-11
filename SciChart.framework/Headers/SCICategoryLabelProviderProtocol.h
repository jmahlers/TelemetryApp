//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICategoryLabelProviderProtocol.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCILabelProviderProtocol.h"
#import "SCIEnumerationConstants.h"

/**
 * Protocol to define a LabelProvider for category axes
 */
@protocol SCICategoryLabelProviderProtocol <SCILabelProviderProtocol>

/**
 * Gets the Bar Time Frame in seconds. This is the number of seconds that each data-point represents on the `SCICategoryDateTimeAxis` and is required for proper rendering.
 */
@property (readonly, nonatomic) double barTimeFrame;

/**
 * Transforms an index of a data point to the corresponding `NSDate` data value.
 * @param index The index
 * @return The data value
 */
- (NSDate *)transformIndexToData:(int)index;

/**
 * Transforms a `NSDate` value to the nearest data point index.
 * @param dataValue The `NSDate` value
 * @return The index of the data point
 */
- (int)transformDataToIndex:(NSDate *)dataValue;

/**
 * Transforms a `NSDate` value to the corresponding data point index using the specified search mode.
 * @param dataValue The `NSDate` value
 * @param mode The search mode
 * @return The index of data point
 */
- (int)transformDataToIndex:(NSDate *)dataValue withSearchMode:(SCIArraySearchMode)mode;

@end
