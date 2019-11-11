//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIScientificNotation.h is part of SCICHART®, High Performance Scientific Charts
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

#ifndef SciChart_SCIScientificNotation_h
#define SciChart_SCIScientificNotation_h

/**
 * Defines constant for scientific or engineering notation on {@link NumericAxis}
 */
typedef NS_ENUM(int, SCIScientificNotation) {
    /**
     * Default tick labeling, e.g. 10000
     */
    SCIScientificNotation_None,
    
    /**
     * Normalized (Scientific) tick labeling, e.g. 1x10^4 with superscript
     */
    SCIScientificNotation_Normalized,
    
    /**
     * Engineering tick labeling, e.g. 1E+4 without superscript
     */
    SCIScientificNotation_E,
    
    /**
     * Tick labelling with of power of other bases, determined by {@link LogarithmicNumericAxis#getLogarithmicBase()}
     * E.g. 1x[base]+4 with superscript
     */
    SCIScientificNotation_LogarithmicBase
};

#endif
