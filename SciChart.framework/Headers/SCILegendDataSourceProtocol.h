//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendDataSourceProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * Defines the protocol for SCILegendDataSource.
 */
@protocol SCILegendDataSourceProtocol <NSObject>

/**
 * Creates a new instance of the `SCILegendDataSource` class.
 * @param legend The `SCIChartLegend` whith which this data source is associated.
 */
- (instancetype)initWithLegend:(SCIChartLegend *)legend;

@end
