//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIPointMarkerClusterizer.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup PointMarkers
 *  @{
 */

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "SCICallbackBlock.h"

@protocol SCIPointMarkerProtocol;
@protocol SCIRenderContext2DProtocol;

typedef struct {
    unsigned char * _data;
    int _width;
    int _height;
    CGSize _area;
    float _spacing;
    float _spacingMultiplier;
} SCIPointMarkerClusreizerInfo;

@interface SCIPointMarkerClusterizer : NSObject <NSCopying> {
    SCIPointMarkerClusreizerInfo info;
}

@property (nonatomic) CGSize area;
@property (nonatomic) float spacing;

-(void) clear;
-(void) purge;

-(void) drawPointMarker:(__unsafe_unretained id<SCIPointMarkerProtocol>)marker
                    AtX:(double)X Y:(double)Y
              ToContext:(__unsafe_unretained id<SCIRenderContext2DProtocol>)context;

@property (nonatomic, copy) SCIActionBlock propertiesChanged;

-(SCIPointMarkerClusreizerInfo*) getClusterizerInfo;

@end

static inline BOOL SCI_markSpot(SCIPointMarkerClusreizerInfo * data, float x, float y) {
    if ( y < 0 || x < 0 || y > data->_area.height || x > data->_area.width) {
        return NO;
    }
    
    if (isnan(x) || isnan(y)) {
        return NO;
    }
    
    int mapX = x * data->_spacingMultiplier;
    int mapY = y * data->_spacingMultiplier;
    
    unsigned char * map = data->_data;
    map += (mapY * data->_width + mapX);
    
    if (*map != 0) {
        return NO;
    } else {
        *map = 1;
        return YES;
    }
}

/**
 * @}
 */
