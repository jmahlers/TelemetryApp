//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICategoryLabelProviderBase.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIFormatterLabelProviderBase.h"
#import "SCICategoryLabelProviderProtocol.h"
#import "SCIArrayController.h"
#import "SCICategoryDateTimeAxis.h"

/**
 * Defines a base class for label provider used by category axes.
 */
@interface SCICategoryLabelProviderBase : SCIFormatterLabelProviderBase<SCICategoryLabelProviderProtocol>

/**
 * Creates a new instance of `SCITradeChartAxisLabelProvider` class.
 *
 * @param labelFormatter The `SCILabelFormatterProtocol` used by this label provider.
 */
- (instancetype)initWithLabelFormatter:(id<SCILabelFormatterProtocol>)labelFormatter;

/**
 * Updates this label provider with new data
 *
 * @param axis     The parent axis
 * @param xValues  The xValues used by this label provider
 * @return The new bar time frame in seconds
 */
- (double)updateBarTimeFrameWithAxis:(SCICategoryDateTimeAxis *)axis XValues:(SCIArrayController *)xValues;

/**
 * Finds index of the data-value in the point-series using corresponding `SCIArraySearchMode`.
 *
 * @param dataValue    Value to which this transformation will be applied.
 * @param mode         The `SCIArraySearchMode`, which will be used to search in `SCIArrayController`.
 * @param xValues      The x values collection.
 * @return Index of the dataValue in the xValues collection.
 */
- (int)transformDataToIndexInternal:(double)dataValue searchMode:(SCIArraySearchMode)mode XValues:(SCIArrayController *)xValues;

/**
 * Finds the dataValue based on it's index in the corresponding xValues collection.
 *
 * @param index        Index of the sought dataValue.
 * @param xValues      The x values collection.
 * @return The dataValue based on it's index in the corresponding xValues collection.
 */
- (double)transformIndexToDataInternal:(int)index XValues:(SCIArrayController *)xValues;

@end
