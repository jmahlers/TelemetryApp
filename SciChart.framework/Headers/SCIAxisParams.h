//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAxisParams.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCIIndexRange;
@protocol SCIPointSeriesProtocol;
@class SCIArrayController;

@interface SCIAxisParams : NSObject {
    @public
    bool flipCoordinates;
    double size;
    double offset;
    
    double visibleMax;
    double visibleMin;
    
    bool isPolarAxis;
    bool isCategoryAxis;
    
    bool isLogarithmicAxis;
    double logarithmicBase;
    
    bool isXAxis;
    bool isHorizontal;
    
    id<SCIPointSeriesProtocol> categoryPointSeries;
    SCIIndexRange * pointRange;
    double dataPointWidth;
}

-(BOOL) equals:(id)obj;

@end

/** @}*/
