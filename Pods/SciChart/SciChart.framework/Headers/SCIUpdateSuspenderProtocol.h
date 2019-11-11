//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIUpdateSuspenderProtocol.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup Renderer
 *  @{
 */
#import <Foundation/Foundation.h>
#import "SCIDisposableProtocol.h"

/**
 * Defines the interface to an SCIUpdateSuspender, a disposable class which allows nested suspend/resume operations on an SCISuspendableProtocol instance
 */
@protocol SCIUpdateSuspenderProtocol <SCIDisposableProtocol>

/**
 * Gets a value indicating whether updates for this instance are currently suspended
 * @return True is this instance is suspended
 */
- (BOOL)isSuspended;

/**
 * Gets or sets a value indicating whether the target will resume when the SCIUpdateSuspenderProtocol is disposed. Default is YES.
 * @return If true then target will call -resumeUpdates: of SCISuspendableProtocol after the SCIUpdateSuspenderProtocol is disposed
 */
@property (nonatomic) BOOL resumeTargetOnClose;

@end

/**
 * @}
 */
