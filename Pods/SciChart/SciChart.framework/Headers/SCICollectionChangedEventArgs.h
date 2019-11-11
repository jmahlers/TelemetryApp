//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCICollectionChangedEventArgs.h is part of SCICHART®, High Performance Scientific Charts
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

/**
 * Defines an enumeration with collection changed types
 */
typedef NS_ENUM(NSUInteger, SCICollectionChangedAction) {
    /**
     * Add one or more items from collection
     */
    SCICollectionChangedAction_Add,

    /**
     * Remove one or more items from collection
     */
    SCICollectionChangedAction_Remove,

    /**
     * Replace one or more items in collection
     */
    SCICollectionChangedAction_Replace,

    /**
     * Reset the content of collection
     */
    SCICollectionChangedAction_Reset
};

@class SCICollectionChangedEventArgs;

typedef void (^SCICollectionChangedCallback) (SCICollectionChangedEventArgs *);

@interface SCICollectionChangedEventArgs : NSObject

/**
 * Gets the list of new items involved in the change.
 */
@property (nonatomic, strong) NSArray * addedItems;

/**
 * Gets the old items which were removed or replaced in this change
 */
@property (nonatomic, strong) NSArray * removedItems;

/**
 * Gets the index at which the change occurred.
 */
@property (nonatomic) int addedIndex;

/**
 * Gets the index at which the change occurred.
 */
@property (nonatomic) int removedIndex;

/**
 * Gets the action that caused the event.
 */
@property (nonatomic) SCICollectionChangedAction action;

-(id) initWithAction:(SCICollectionChangedAction)action RemovedItems:(NSArray*)removedItems RemovedIndex:(int)removedIndex AddedItems:(NSArray*)addedItems AddedIndex:(int)addedIndex;

@end
