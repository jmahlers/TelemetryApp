//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIArrayControllerFIFO.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup DataSeries
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIArrayController.h"

/**
 * The class provides fifo(first-input first-output) mechanism. After appending new data, method "normalizeIndices" must be called. Default fifo size is 128 items. Size can be set with custom initializer in example below.
 * @code
 * let arrayControllerFIFO = SCIArrayControllerFIFO(type: .double, size: 64)
 * @endcode
 * And the class is used in fifo data series.
 * @code
 * let dataSeriesFifo = SCIXyDataSeries(fifoWithXType: .double, yType: .double, fifoSize: 64) //Creating fifo data series.
 * @endcode
 */
@interface SCIArrayControllerFIFO : SCIArrayController

/**
 * Current index in fifo queue. If count >= size then next value, which is appended, must be appended instead value under the headIndex. And then "normalizeIndices" method should be called.
 */
-(int) headIndex;

/**
 * The method reorders all data if It is needed. It must be reodered if headIndex != 0, it means that new value which was appended last time, doesn't fit into the size of fifo, and it is appended instead first value and array of values should be reodered.
 */
-(void) normalizeIndices;

@end

/** @}*/
