//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIVisibleRangeAnimatorProtocol.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIRangeProtocol.h"
#import "SCIAxisCoreProtocol.h"

/**
 * Defines the protocol with methods for animating VisibleRange of `SCIAxisCoreProtocol`.
 */
@protocol SCIVisibleRangeAnimatorProtocol <NSObject>

- (void)attach:(id<SCIAxisCoreProtocol>)axis;

- (void)detach:(id<SCIAxisCoreProtocol>)axis;

/**
 * Animates VisibleRange to specified range.
 * @param to       The `SCIRangeProtocol` instance to animate to.
 * @param duration The duration of animation measured in seconds.
 */
- (void)animateTo:(id<SCIRangeProtocol>)to duration:(NSTimeInterval)duration;

/**
 * Cancels running animation.
 */
- (void)cancelAnimation;

/**
 * Gets the value indicating whether the animation is running.
 * @return True if animation is running.
 */
@property(nonatomic, readonly) BOOL isAnimating;

@end
