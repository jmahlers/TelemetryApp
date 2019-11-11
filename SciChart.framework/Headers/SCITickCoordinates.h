//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITickCoordinates.h is part of SCICHART®, High Performance Scientific Charts
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

@interface SCITickCoordinates : NSObject

-(id) initWithMinorTicks:(double*)minorTicks Count:(int)minorTicksCount
              MajorTicks:(double*)majorTicks Count:(int)majorTicksCount
   MinorTicksCoordinates:(float*)minorTickCoord Count:(int)minorTickCoordCount
   MajorTicksCoordinates:(float*)majorTickCoord Count:(int)majorTickCoordCount;
-(BOOL) isEmpty;
-(void) getMinorTicks:(double**)ticks Count:(int*)count;
-(void) getMajorTicks:(double**)ticks Count:(int*)count;
-(void) getMinorTickCoordinates:(float**)ticks Count:(int*)count;
-(void) getMajorTickCoordinates:(float**)ticks Count:(int*)count;

@end
