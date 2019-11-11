//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisInfo.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Axis
 *  @{
 */

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "SCIAxisEnums.h"
#import "SCIGenericType.h"

@class SCITooltipDataView;

@interface SCIAxisInfo : NSObject

@property (nonatomic, copy) NSString * axisId;
@property (nonatomic, copy) NSString * axisTitle;
@property (nonatomic) SCIAxisAlignment axisAlignment;
@property (nonatomic) SCIGenericType dataValue;
@property (nonatomic, copy) NSString * axisFormattedDataValue;
@property (nonatomic) BOOL isHorizontal;
@property (nonatomic) BOOL isXAxis;
@property (nonatomic, copy) NSString * cursorFormattedDataValue;
@property (nonatomic) BOOL isMasterChartAxis;
@property (nonatomic) CGRect frame;
@property (nonatomic) NSNumberFormatter * numberFormatter __deprecated;
@property (nonatomic) NSDateFormatter * dateTimeFormatter __deprecated;

-(SCITooltipDataView *) createAxisDataView;

@end

/** @}*/
