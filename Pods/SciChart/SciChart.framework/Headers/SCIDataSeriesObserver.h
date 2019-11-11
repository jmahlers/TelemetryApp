//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDataSeriesObserver.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCICallbackBlock.h"

@interface SCIDataSeriesObserver : NSObject

- (instancetype _Nonnull )initWithDataSeriesChangedBlock:(SCIActionBlock _Nonnull )block;

/**
 * Callback is called every time when somthing chages in data series (appending new values, removing, inserting).
 * @code
 *
 * let dataSeriesXy = SCIXyDataSeries(xType: .double, yType: .double)
 * dataSeriesXy?.onDataSeriesChanged = {() -> () in return
 *   print(dataSeriesXy?.count()) // Add some code here which will be run when data series is changed
 * }
 * dataSeriesXy?.appendX(SCIGeneric(2.0), y: SCIGeneric(3.0))
 *
 * @endcode
 */
@property (nonatomic, copy, nonnull) SCIActionBlock onDataSeriesChanged;

@end
