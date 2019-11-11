//******************************************************************************
// SCICHART® Copyright SciChart Ltd. 2011-2018. All rights reserved.
//
// Web: http://www.scichart.com
// Support: support@scichart.com
// Sales:   sales@scichart.com
//
// SCIObservableCollection.h is part of SCICHART®, High Performance Scientific Charts
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

@class SCICollectionObserver;

/**
 * @brief Provides functionality for AxisCollection class
 */
@interface SCIObservableCollection<__covariant ObjectType> : NSObject <NSFastEnumeration>

/**
 * Gets the quantity of objects in collection
 */
- (int)count;

/**
 * Removes all objects from collection
 */
- (void)clear;

/**
 * Add object into SCIObservableCollection
 */
- (void)add:(ObjectType)item;

/**
 * Removes object instance from this collection.
 *
 * @param item Object instance to be deleted from the collection, if present in it.
 * @return Return YES If item is removed, otherwise NO
 */
- (BOOL)remove:(ObjectType)item;

/**
 * Removes objects instance from collection
 * @param index Index of item, which will be deleted from collection
 */
- (void)removeAt:(int)index;

/**
 * Return object at index from SCIObservableCollection
 */
- (ObjectType)itemAt:(int)index;

/**
 * Insert object into SCIObservableCollection at Index
 */
- (void)insert:(ObjectType)item At:(int)index;

/**
 * Return first object from SCIObservableCollection
 */
- (ObjectType)firstObject;

/**
 * Replaces the element at the specified position in this collection with the specified element.
 *
 * @param object object to be stored at the specified position
 * @param index index of the element to replace
 */
- (void)setObject:(id)object atIndex:(unsigned int)index;

/**
 * Return YES If item is in collection.
 */
- (BOOL)contains:(ObjectType)item;

/**
 * Returns the index of the first occurrence of the specified element in this collection.
 *
 * @return Returns the index of the first occurrence, otherwise returns -1.
 */
- (int)indexOf:(ObjectType)item;

/**
 * Add observer for the collection.
 */
- (void)addObserver:(SCICollectionObserver*)observer;

/** Remove observer for the collection.
 */
- (void)removeObserver:(SCICollectionObserver*)observer;

@end

/**
 * @brief Category which provides ability to get object from collection by index. And set object by index.
 * @code 
 * ObjectType* firstObject = observableCollection[0];
 *
 * observableCollection[0] = firstObject;
 * @endcode
 */
@interface SCIObservableCollection<__covariant ObjectType> (Indexing)

- (ObjectType)objectAtIndexedSubscript:(unsigned int)idx;

- (void)setObject:(ObjectType)obj atIndexedSubscript:(unsigned int)idx;

@end
