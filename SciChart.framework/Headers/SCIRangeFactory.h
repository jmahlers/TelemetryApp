//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRangeFactory.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Ranges
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIRangeProtocol.h"
#import "SCIGenericType.h"
#import "SCIDataType.h"

@interface SCIRangeFactory : NSObject

+(id<SCIRangeProtocol>) clone:(id<SCIRangeProtocol>)originalRange WithMin:(SCIGenericType)min Max:(SCIGenericType)max Limit:(id<SCIRangeProtocol>)rangeLimit;
+(id<SCIRangeProtocol>) clone:(id<SCIRangeProtocol>)originalRange WithMin:(SCIGenericType)min Max:(SCIGenericType)max;
+(id<SCIRangeProtocol>) getRangeOfType:(SCIDataType)type Min:(SCIGenericType)min Max:(SCIGenericType)max;
+(id<SCIRangeProtocol>) getRangeWithRangeType:(Class)type Min:(SCIGenericType)min Max:(SCIGenericType)max;

@end

/** @}*/
