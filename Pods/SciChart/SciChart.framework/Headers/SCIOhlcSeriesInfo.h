//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIOhlcSeriesInfo.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup SeriesInfo
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCISeriesInfo.h"

@interface SCIOhlcSeriesInfo : SCISeriesInfo {
@protected
    SCIGenericType _openValue;
    SCIGenericType _highValue;
    SCIGenericType _lowValue;
    SCIGenericType _closeValue;
}

-(SCIGenericType) openValue;
-(SCIGenericType) highValue;
-(SCIGenericType) lowValue;
-(SCIGenericType) closeValue;


@end

/** @}*/