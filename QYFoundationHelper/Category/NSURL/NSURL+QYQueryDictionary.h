//
//  NSURL+QYQueryDictionary.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

//收录自  https://github.com/itsthejb/NSURL-QueryDictionary

@interface NSURL (URLQuery)

/**
 *  @return URL's query component as keys/values
 *  Returns nil for an empty query
 */
- (NSDictionary*)queryDictionary;

/**
 *  @return URL with keys values appending to query string
 *  @param queryDictionary Query keys/values
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @warning If keys overlap in receiver and query dictionary,
 *  behaviour is undefined.
 */
- (NSURL*)urlByAppendingQueryDictionary:(NSDictionary*)queryDictionary withSortedKeys:(BOOL)sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL*)urlByAppendingQueryDictionary:(NSDictionary*)queryDictionary;

/**
 *  @return Copy of URL with its query component replaced with
 *  the specified dictionary.
 *  @param queryDictionary A new query dictionary
 *  @param sortedKeys      Whether or not to sort the query keys
 */
- (NSURL*)urlByReplacingQueryWithDictionary:(NSDictionary*)queryDictionary withSortedKeys:(BOOL)sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL*)urlByReplacingQueryWithDictionary:(NSDictionary*)queryDictionary;

/** @return Receiver with query component completely removed */
- (NSURL*)urlByRemovingQuery;

@end

#pragma mark -

@interface NSString (URLQuery)

/**
 *  @return If the receiver is a valid URL query component, returns
 *  components as key/value pairs. If couldn't split into *any* pairs,
 *  returns nil.
 */
- (NSDictionary*)urlQueryDictionary;

@end

#pragma mark -

@interface NSDictionary (URLQuery)

/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString*)urlQueryStringWithSortedKeys:(BOOL)sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSString*)urlQueryString;

@end

