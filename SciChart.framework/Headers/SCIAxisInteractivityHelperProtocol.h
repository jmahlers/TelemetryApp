//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisInteractivityHelperProtocol.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIEnumerationConstants.h"

@protocol SCIRangeProtocol;

#pragma mark - SCIAxisInteractivityHelper protocol

/**
 *
 */
@protocol SCIAxisInteractivityHelperProtocol ///
        <NSObject>
/** @{ @} */

- (id<SCIRangeProtocol>)zoom:(id<SCIRangeProtocol>)initialRange From:(double)fromCoord To:(double)toCoord;

- (id<SCIRangeProtocol>)zoom:(id<SCIRangeProtocol>)initialRange ByMin:(double)minFraction Max:(double)maxFraction;

- (id<SCIRangeProtocol>)scrollInMinDirection:(id<SCIRangeProtocol>)rangeToScroll ForPixels:(double)pixels;

- (id<SCIRangeProtocol>)scrollInMaxDirection:(id<SCIRangeProtocol>)rangeToScroll ForPixels:(double)pixels;

- (id<SCIRangeProtocol>)scroll:(id<SCIRangeProtocol>)rangeToScroll ForPixels:(double)pixels AndVelocity:(float *)velocity __deprecated;

- (id<SCIRangeProtocol>)scroll:(id<SCIRangeProtocol>)rangeToScroll byPixels:(double)pixels;

- (id<SCIRangeProtocol>)clipRange:(id<SCIRangeProtocol>)rangeToClip ToMaximum:(id<SCIRangeProtocol>)maximumRange ClipMode:(SCIClipMode)clipMode;

@end
