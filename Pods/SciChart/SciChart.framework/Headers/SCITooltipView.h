//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCITooltipView.h is part of SCICHART®, High Performance Scientific Charts
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

/** \addtogroup ChartModifiers
 *  @{
 */

#import <UIKit/UIKit.h>

@class SCITooltipDataView;

@interface SCITooltipView : UIView

@property (weak, nonatomic) IBOutlet UIView *dataView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dataViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dataViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dataViewLeftBorder;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dataViewTopBorder;


@property (nonatomic) CGSize fixedSize;
@property (nonatomic) float contentPadding;

-(void)addDataView:(SCITooltipDataView*)view;
-(void)removeAll;

+(SCITooltipView *) createInstance;

@end

/** @}*/