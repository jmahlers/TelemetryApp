//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCISeriesInfo.h is part of SCICHART®, High Performance Scientific Charts
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
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SCIGenericType.h"
#import "SCIDataSeries.h"
#import "SCIHitTestProviderBase.h"

@protocol SCIRenderableSeriesProtocol;
@protocol SCIPathColorProtocol;
@class UIView;
@class SCITooltipDataView;

@interface SCISeriesInfo : NSObject {
@protected
    id<SCIRenderableSeriesProtocol> _renderableSeries;
    NSString * _seriesName;
    SCIGenericType _xValue;
    SCIGenericType _yValue;
    SCIDataSeriesType _dataSeriesType;
    BOOL _isHit;
    int _dataSeriesIndex;
    
    UIColor * _seriesColor;
}

@property (nonatomic, strong) NSNumberFormatter * numberFormatter __deprecated;
@property (nonatomic, strong) NSDateFormatter * dateTimeFormatter __deprecated;

-(instancetype)initWithSeries:(id<SCIRenderableSeriesProtocol>)series HitTest:(SCIHitTestInfo)hitTest;

- (BOOL)isVisible;
-(id<SCIRenderableSeriesProtocol>) renderableSeries;
-(NSString *) seriesName;
-(SCIGenericType) xValue;
-(SCIGenericType) yValue;
-(SCIDataSeriesType) dataSeriesType;
-(BOOL) isHit;
-(int) dataSeriesIndex;

-(UIColor *) seriesColor;

-(SCITooltipDataView *) createDataSeriesView;

- (NSString *)formatXCursorValue:(SCIGenericType)value;

- (NSString *)formatYCursorValue:(SCIGenericType)value;

- (NSString *)fortmatterdValueFromSeriesInfo:(SCIGenericType)data forDataType:(SCIDataType)dataType __deprecated_msg("Please use formatXCursorValue/formatYCursorValue instead");

@end

/** @}*/
