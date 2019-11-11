//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDataDistributionCalculatorProtocol.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCIArrayControllerProtocol.h"

@protocol SCIDataDistributionCalculatorProtocol <NSObject>

@property (nonatomic, readonly) BOOL dataIsSortedAscending;

@property (nonatomic, readonly) BOOL dataIsEvenlySpaced;

- (BOOL)dataIsSortedAscending;

- (BOOL)dataIsEvenlySpaced;

- (void)clear;

- (void)onAppendValueInArrayController:(id<SCIArrayControllerProtocol>)array andCount:(int)count acceptsUnsortedData:(BOOL)acceptsUnsortedData;

- (void)onUpdateValueInArrayController:(id<SCIArrayControllerProtocol>)array atIndex:(int)atIndex acceptsUnsortedData:(BOOL)acceptsUnsortedData;

- (void)onInsertValueInArrayController:(id<SCIArrayControllerProtocol>)array atIndex:(int)atIndex andCount:(int)count acceptsUnsortedData:(BOOL)acceptsUnsortedData;

@end
