//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCILegendItemView.h is part of SCICHART®, High Performance Scientific Charts
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
#import "SCILegendItemViewProtocol.h"

/**
 * The class is used in SCILegendCollectionModifier to visualize SCILegendItem.
 * @see SCILegendCollectionModifier
 * @see SCILegendItem
 */
__deprecated_msg("Please use custom SCIDefaultLegendItemBase or it's inheritors instead.")
@interface SCILegendItemView : UIView<SCILegendItemViewProtocol>

/**
 * New images for states can be set in SCILegendCellStyle which is property of SCILegendCollectionModifier.
 * Also it can be hidden if set property showCheckBoxes = NO.
 * @code
 * SCILegendCollectionModifier *legendModifier = [SCILegendCollectionModifier new];
 * legendModifier.showCheckBoxes = NO;
 * legendModifier.styleOfItemCell.checkedBoxImage = [UIImage new];
 * legendModifier.styleOfItemCell.uncheckedBoxImage = [UIImage new];
 * @endcode
 * @see SCILegendCellStyle
 * @see SCILegendCollectionModifier
 * @see SCILegenModifier
 */
@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;

/**
 * The size can be set in SCILegendCellStyle which is property of SCILegendCollectionModifier.
 * Also it can be hidden if set property showSeriesMarkers = NO.
 * @code
 * SCILegendCollectionModifier *legendModifier = [SCILegendCollectionModifier new];
 * legendModifier.showSeriesMarkers = NO;
 * legendModifier.styleOfItemCell.sizeMarkerView = CGSizeMake(320.f, 320.f);
 * @endcode
 * @see SCILegendCellStyle
 * @see SCILegendCollectionModifier
 * @see SCILegenModifier
 */
@property (weak, nonatomic) IBOutlet UIView *markerView;

/**
 * Font and text color can be changed in seriesNameLabel.
 * @code
 * SCILegendCollectionModifier *legendModifier = [SCILegendCollectionModifier new];
 * legendModifier.styleOfItemCell.seriesNameFont = [UIFont fontWithName:@"Helvetica" size:16.f];
 * legendModifier.styleOfItemCell.seriesNameTextColor = [UIColor grayColor];
 * @endcode
 * @see SCILegendCellStyle
 * @see SCILegendCollectionModifier
 * @see SCILegenModifier
 */
@property (weak, nonatomic) IBOutlet UILabel *seriesNameLabel;

/**
 * The method are used in SCILegendCollectionModifier for setting style of cell.
 * @see SCILegendCollectionModifier
 */
- (void)setCustomStyleForCell:(SCILegendCellStyle*)style;

@end

/** @}*/
