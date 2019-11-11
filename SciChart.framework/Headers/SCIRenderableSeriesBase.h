//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIRenderableSeriesBase.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup RenderableSeries
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIThemeableProtocol.h"
#import "SCIRenderableSeriesProtocol.h"
#import "SCIAnimation.h"
#import "SCIRenderableSeriesAnimationProtocol.h"

@protocol SCIPointSeriesProtocol;
@protocol SCICoordinateCalculatorProtocol;
@protocol SCIRenderableSeriesProtocol;
@class SCIAnimationsController, SCIDataSeriesObserver;

/**
 * @abstract block represents action that is performed for every data point
 * @discussion For internal use
 * @param xValue double X data value
 * @param yValue double Y data value
 * @param xCoordinate double X point coordinate
 * @param yCoordinate double Y point coordinate
 * @param index int data point index in data series
 */
typedef void(^IterationPassDataHandler)(double xValue, double yValue, double xCoordinate, double yCoordinate, int index);

/**
 * @brief Class provides base functions for all renderable series
 * @see SCIRenderableSeriesProtocol
 */
@interface SCIRenderableSeriesBase : NSObject <SCIRenderableSeriesProtocol, SCIThemeableProtocol> {
    @protected id<SCIPointSeriesProtocol> _previousPointSeries; // Point series from last main render loop. The series is not changed while animation loop is running.
    @protected SCIAnimationsController *_animationsController; // Animations controller contains all nimation of the renderable series.
    @protected SCIDataSeriesObserver *_dataSeriesObserver; // Data series observer of changing data.
}

/**
 * @brief If method returns false renderable series is not valid for drawing
 */
- (BOOL)isValidForDrawing;

/**
 * @brief Returns data point width in pixels
 * @discussion For internal use. Has value for charts like candlestick or columns. Method is called during series drawing
 * @discussion All data for this method acquired from currentRenderPassData
 * @params pointSeries SCIPointSeries data points after resampling, which is used in drawing loop
 * @params barsAmount int amount of data points in current viewport
 * @params xCalc SCICoordinateCalculator that converts data values to screen coordinates
 * @params widthFraction double value from 0 to 1, relative size of data points where 0 is zero width, and 1 is no gaps between data points
 * @returns float data point width in pixels
 * @see SCIPointSeriesProtocol
 * @see SCICoordinateCalculator
 */
- (float)getDatapointWidthFrom:(id <SCIPointSeriesProtocol>)pointSeries Amount:(int)barsAmount Calculator:(id <SCICoordinateCalculatorProtocol>)xCalc WidthFraction:(double)widthFraction;

/**
 * @brief Method that implements renderable series drawing.
 * @discussion For internal use. Method is called during render loop, at the beginning of renderable series drawing
 * @params renderContext SCIRenderContext2D openGL drawing context where renderable series should be drawn
 * @params renderPassData SCIRenderPassData contains all data required for drawing. Usually it is equal to "currentRenderPassData"
 * @see SCIRenderContext2DProtocol
 * @see SCIRenderPassDataProtocol
 */
- (void)internalDrawWithContext:(id <SCIRenderContext2DProtocol>)renderContext WithData:(id <SCIRenderPassDataProtocol>)renderPassData;

/**
 * @brief Method that iterates through data points
 * @discussion For internal use
 * @params renderPassData SCIRenderPassData contains all data required for drawing. Usually it is equal to "currentRenderPassData"
 * @params handler IterationPassDataHandler action block that is called for every data point
 * @see SCIRenderPassData
 * @see IterationPassDataHandler
 */
- (void)iterationInRenderPassData:(id <SCIRenderPassDataProtocol>)renderPassData withBlock:(IterationPassDataHandler)handler;

@end

/** @}*/
