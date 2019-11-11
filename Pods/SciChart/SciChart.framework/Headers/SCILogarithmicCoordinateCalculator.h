//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILogarithmicCoordinateCalculator.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCICoordinateCalculatorProtocol.h"

/**
 @extends SCICoordinateCalculatorProtocol
 */
@protocol SCILogarithmicCoordinateCalculatorProtocol ///
<SCICoordinateCalculatorProtocol>
/** @{ @} */

-(double) logarithmicBase;

/**
 * Applies a logarithmic transformation to the provided data value, returning the exponent of it.
 * @param dataValue Value to which logarithmic transformation will be applied.
 * @return The logarithmic transformation result.
 */
- (double)toExponent:(double)dataValue;

/**
 * Applies the inverse transformation to the provided exponent, returning the corresponding data value.
 * @param exponent Exponent which will to which the inverse logarithmic transformation will be applied.
 * @return The inverse logarithmic transformation result.
 */
- (double)fromExponent:(double)exponent;

@end

/** @}*/
