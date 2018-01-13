$PBExportHeader$n_cst_dwcache.sru
$PBExportComments$Extension DataWindow Caching service
forward
global type n_cst_dwcache from pfc_n_cst_dwcache
end type
end forward

global type n_cst_dwcache from pfc_n_cst_dwcache
end type
global n_cst_dwcache n_cst_dwcache

forward prototypes
public function integer of_getregistered (string as_id, ref n_ds ads_cache, boolean ab_refreshifempty)
public function long of_refreshifempty (string as_id)
public function integer of_getregistered (string as_id, ref n_ds ads_cache)
end prototypes

public function integer of_getregistered (string as_id, ref n_ds ads_cache, boolean ab_refreshifempty);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetRegistered
//	Arguments:		as_id			The ID of the registered datastore for which a reference is wanted.
//						ads_cache	A reference to the Datastore matching the passed ID (by reference).
//						ab_refreshIfEmpty		If TRUE, then refresh ads_cache if it is empty.
//	Returns:  		Integer 		1 success the ads_cache holds the desired reference, -1 error.
//	Description:		Returns a reference to the Datastore matching the passed ID.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:
//	1.9.2017		<RP>		Added this variation of the function to preserve backward compatability
//								when implementing automatic just-in-time caching
//////////////////////////////////////////////////////////////////////////////
integer li_ret

li_ret = SUPER::of_getregistered(as_id, ads_cache)

IF (li_ret = 1) AND ab_refreshIfEmpty THEN
	of_RefreshIfEmpty(as_id)
END IF

return li_ret

end function

public function long of_refreshifempty (string as_id);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RefreshIfEmpty
//	Arguments:		as_id			The ID of the registered datastore
//
//	Returns:  		Long 		The number of rows in the cache, if successful
//									-1 - Error, or cache is not registered
//
//	Description:		If the identified cache is empty, refresh it
//						Return the number of rows in the cache
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Date
//						1.9.2017   	Initial version by Ronnie Po
//
//						1.19.2017	Added logic which takes into account whether
//										the cache contains zero rows even after it is refreshed
//////////////////////////////////////////////////////////////////////////////
n_ds lds_cache
long ll_ret
integer ll_cacheStatus

IF of_isRegistered(as_id) <> 1 THEN
	return -1
ELSEIF of_getRegistered(as_id, lds_cache, FALSE) <> 1 THEN
	return -1
END IF

// <RP> 1.19.2017
ll_cacheStatus = gnv_app.of_getCacheStatus(as_id)

/* Special processing for certain caches */
CHOOSE CASE as_id
	CASE "dddw_contracted_entity"
		IF ll_cacheStatus = 1 THEN
			return lds_cache.rowCount()
		END IF
END CHOOSE

IF lds_cache.rowCount() = 0 THEN
//IF ll_cacheStatus = 0 THEN
////--------------- <RP> 1.16.2017----------------------------------------------------------------
//// Debug
//f_message_console(this.ClassName() + " - Refresh cache " + as_id + ": " + string(now()))
////----------------------------------------------------------------------------------------------
	ll_ret = of_refresh(as_id)
	IF ll_ret = -1 THEN
		return -1
	ELSE
		gnv_app.of_setCacheStatus(as_id, 1)
		return ll_ret
	END IF
ELSE
	return lds_cache.rowCount()
END IF

end function

public function integer of_getregistered (string as_id, ref n_ds ads_cache);//----------------------- <RP> 1.9.2017 ----------------------------------------------------------
//	Modified to provide just-in-time caching functionality
//	Assume that all registered cache datastores have NOT been refreshed. Each cache is refreshed
//	only as necessary - when calling this method
//

return of_getRegistered(as_id, ads_cache, TRUE)

end function

on n_cst_dwcache.create
call super::create
end on

on n_cst_dwcache.destroy
call super::destroy
end on

