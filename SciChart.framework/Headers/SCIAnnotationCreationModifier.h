//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIAnnotationCreationModifier.h is part of SCICHART®, High Performance Scientific Charts
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

#import "SCIGestureModifier.h"
#import "SCICreationAnnotationFactory.h"
#import "SCIAnnotationProtocol.h"

@protocol SCIStyleProtocol;

typedef void(^SCIAnnotationCreationHandler)(_Nonnull id<SCIAnnotationProtocol>, _Nonnull SCIAnnotationCreationType);

@interface SCIAnnotationCreationModifier : SCIGestureModifier

@property (nonatomic, nonnull) SCICreationAnnotationFactory *annotationsFactory;

@property (nonatomic, nonnull) SCIAnnotationCreationType annotationType;

@property (nonatomic, nullable) id<SCIStyleProtocol> style;

/**
 * Gets or sets the ID of the X-Axis which this Annotation is measured against
 */
@property (nonatomic, copy, nullable) NSString * xAxisId;

/**
 * Gets or sets the ID of the Y-Axis which this Annotation is measured against
 */
@property (nonatomic, copy, nullable) NSString * yAxisId;

@property (nonatomic, copy, nullable) SCIAnnotationCreationHandler creationHanlder;

- (nonnull instancetype)initWithAnnotationType:(nonnull SCIAnnotationCreationType)annotationType;

@end
