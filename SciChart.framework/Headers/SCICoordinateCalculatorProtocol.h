//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICoordinateCalculatorProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup CoordinateCalculators
 *  @{
 */

@protocol SCIRangeProtocol;

typedef double (*SCICoordinateCalculatorCoordFunction)(void * info, double value);

typedef struct {
    void * info;
    SCICoordinateCalculatorCoordFunction converter;
} SCICoordinateCalculatorHelper;

/**
 */
@protocol SCICoordinateCalculatorProtocol ///
<NSObject>
/** @{ @} */

-(BOOL) isCategoryAxisCalculator;
-(BOOL) isLogarithmicAxisCalculator;
-(BOOL) isHorizontalAxisCalculator;
-(BOOL) isXAxisCalculator;
-(BOOL) hasFlippedCoordinates;
-(BOOL) isPolarAxisCalculator;

@property (nonatomic, readonly) double coordinatesOffset;
- (double)getCoordinateFromDate:(NSDate*)dataValue;
- (double)getCoordinateFrom:(double)dataValue;
- (double)getDataValueFrom:(double)pixelCoordinate;
- (double)getVelocityValueFrom:(double)pixelVelocity __deprecated;
- (id<SCIRangeProtocol>)translateByPixels:(double)pixels InputRange:(id<SCIRangeProtocol>)inputRange;
- (id<SCIRangeProtocol>)translateByMinFraction:(double)minFraction MaxFraction:(double)maxFraction InputRange:(id<SCIRangeProtocol>)inputRange;
-(SCICoordinateCalculatorHelper) getCalculatorHelper;

@end

/** @}*/
