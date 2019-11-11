//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIDefaultLegendItemBase.h is part of SCICHART®, High Performance Scientific Charts
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

#import <UIKit/UIKit.h>
#import "SCILegendItemProtocol.h"

typedef void(^SCILegendCheckboxAction)(BOOL checked);

/**
 * Defines a base class for `SCILegendItemProtocol` implementations.
 */
@interface SCIDefaultLegendItemBase : UICollectionViewCell<SCILegendItemProtocol>

@property (weak, nonatomic) IBOutlet UIButton * checkBoxButton;
@property (weak, nonatomic) IBOutlet UIView * markerView;
@property (weak, nonatomic) IBOutlet UILabel * seriesNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * checkBoxWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * markerWidthConstraint;

/**
 * Gets or sets the action which is used by chechbox button.
 */
@property (nonatomic) SCILegendCheckboxAction checkBoxTouchUpInsideAction;

- (void)setCheckBoxVisibility:(BOOL)visibility;

- (void)setSeriesMarkerVisibility:(BOOL)visibility;

@end
