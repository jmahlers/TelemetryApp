//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIStackedSeriesCollectionBase.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup RenderableSeries
 *  @{
 */

#import <Foundation/Foundation.h>
#import "SCIRenderableSeriesBase.h"
#import "SCIThemeableProtocol.h"

@protocol SCIStackedRenderableSeriesProtocol, SCIRenderPassDataProtocol, SCIStackedSeriesCollectionAnimnationProtocol;
@class SCIRenderPassData, SCIStackedDataHelper;

/**
 * @brief The SCIStackedGroupSeries class.
 * @discussion That series is not visible, but used for organization of drawing SCIStackedRenderableSeries that were added to it.
 * @remark Do not need any data, and do not have styles. Provide data and styles to attached SCIStackedRenderableSeries.
 * @see SCIRenderableSeriesProtocol
 * @see SCIRenderableSeriesBase
 * @see SCIStackedRenderableSeriesProtocol
 */
@interface SCIStackedSeriesCollectionBase : SCIRenderableSeriesBase <SCIThemeableProtocol> {
    @protected NSMutableArray<id <SCIStackedRenderableSeriesProtocol>> *_series;
    @protected NSMutableArray<id <SCIRenderPassDataProtocol>> *_renderData;
    @protected BOOL _drawRequest;
}

/**
 * @brief Method adds stacked series to drawing queue. 
 * @discussion Order of adding matters, because usually data of stacked series is modified with data of all previous stacked series
 * @params series SCIStackedRenderableSeriesProtocol to be drawn
 */
- (void)add:(id <SCIStackedRenderableSeriesProtocol>)series;

/**
 * @brief Method removes stacked series from drawing queue.
 * @params series SCIStackedRenderableSeriesProtocol to be removed
 */
- (void)remove:(id <SCIStackedRenderableSeriesProtocol>)series;

/**
 * @brief Method removes all stacked series from drawing queue.
 */
- (void)removeAll;

/**
 * @brief Returns updated SCIRenderPassData for particular SCIRenderableSeries
 */
- (SCIRenderPassData *)renderDataForSeries:(id <SCIRenderableSeriesProtocol>)series;

/**
 * @brief Defines mode for stacked series, if value is true data convert into percentage
 */
@property BOOL isOneHundredPercentSeries;

- (void) updateRenderData:(SCIRenderPassData*)data ForSeries:(id<SCIStackedRenderableSeriesProtocol>)series;

/**
 Make the series animatable. After adding animation and then change data series of the renderable series make new data appear with animation.
 It is not thread safe method. It should be called only from main thread.
 @code
 renderableSeries.addAnimation(SCIScaleRenderableSeriesAnimation(duration: 5, curveAnimation: SCIAnimationCurveEaseOut))
 renderableSeries.dataSeries = newDataSeries
 @endcode
 @param animation some base animation object which implements SCIStackedSeriesCollectionAnimnationProtocol.
 */
- (void)addAnimation:(id<SCIStackedSeriesCollectionAnimnationProtocol>)animation;

@property (nonatomic, readonly) NSArray<id <SCIStackedRenderableSeriesProtocol>> *series;

@property (nonatomic) SCIDataSeriesObserver *collectionDataSeriesObserver;

@end

@interface SCIStackedSeriesCollectionBase(DrawingDirection)

- (void)recalculateRenderDataForVerticalPlacement;

@end
/** @}*/
