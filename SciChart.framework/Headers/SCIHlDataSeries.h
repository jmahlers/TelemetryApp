//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIHlDataSeries.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SciChart.h"


/**
 * Inteface for all dataSeries which has at least x and y columns.
 @extends SCIDataSeriesProtocol
 */
@protocol SCIHlDataSeriesProtocol ///
<SCIDataSeriesProtocol>
/** @{ @} */

/**
 * Datasource for high column
 */
-(id<SCIArrayControllerProtocol>) highColumn;

/**
 * Datasource for low column
 */
-(id<SCIArrayControllerProtocol>) lowColumn;

/**
 * Returns type of high values
 */
-(SCIDataType) highType;

/**
 * Returns type of low values
 */
-(SCIDataType) lowType;

/**
 * Appends an Open, High, Low, Close point to the series.
 *
 */
-(void) appendX:(SCIGenericType)x Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low;

/**
 * Appends an Open, High, Low, Close range of points to the series.
 *
 */
-(void) appendRangeX:(SCIGenericType)x Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low Count:(int)count;

/**
 * Updates an Y, High and Low point to the series at specified index
 */
-(void) updateAt:(int)index X:(SCIGenericType)x Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low;

/**
 * Updates an Y, High and Low point to the series at specified index
 */
-(void) updateAt:(int)index Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low;

/**
 * Updates an Y, High and Low range of points to the series at specified index
 */
-(void) updateRangeAt:(int)index Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low Count:(int)count;

/**
 * Inserts X and Y, High and Low points to the series at specified index
 */
-(void) insertAt:(int)index X:(SCIGenericType)x Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low;

/**
 * Inserts X and Y, High and Low range of points to the series at specified index
 */
-(void) insertRangeAt:(int)index X:(SCIGenericType)x Y:(SCIGenericType)y High:(SCIGenericType)high Low:(SCIGenericType)low Count:(int)count;

@end

@interface SCIHlDataSeries : SCIDataSeries<SCIHlDataSeriesProtocol>
/**
 * Datasource for high column
 */
@property (nonatomic, strong) id<SCIArrayControllerProtocol> highColumn;

/**
 * Datasource for low column
 */
@property (nonatomic, strong) id<SCIArrayControllerProtocol> lowColumn;

@end

/** @}*/
