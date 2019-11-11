//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRenderPassData.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIIndexRange;
@protocol SCIPointSeriesProtocol;
@protocol SCICoordinateCalculatorProtocol;
@protocol SCIDataSeriesProtocol;
@protocol SCIRenderableSeriesProtocol;

#pragma mark - SCIRenderPassData protocol

@protocol SCIRenderPassDataProtocol <NSObject>

@required
-(SCIIndexRange *) pointRange;
-(id<SCIPointSeriesProtocol>) pointSeries;
-(id<SCIDataSeriesProtocol>) dataSeries;
-(id<SCIRenderableSeriesProtocol>) renderableSeries;
-(BOOL) isVerticalChart;
-(id<SCICoordinateCalculatorProtocol>) yCoordinateCalculator;
-(id<SCICoordinateCalculatorProtocol>) xCoordinateCalculator;

@end

#pragma mark - SCIRenderPassData default implementation

@interface SCIRenderPassData : NSObject <SCIRenderPassDataProtocol>

-(id) initWithPointRange:(SCIIndexRange*)pointRange
             PointSeries:(id<SCIPointSeriesProtocol>)pointSeries
              DataSeries:(id<SCIDataSeriesProtocol>)dataSeries
        RenderableSeries:(id<SCIRenderableSeriesProtocol>)renderableSeries
             YCalculator:(id<SCICoordinateCalculatorProtocol>)yCalculator
             XCalculator:(id<SCICoordinateCalculatorProtocol>)xCalculator;

@end
