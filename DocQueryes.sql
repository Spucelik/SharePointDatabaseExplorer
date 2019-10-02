select * from alllists order by tp_Title desc

select ContentVersion, * from allDocs where Id = 'C8AC0F90-1F7B-4EFB-95A1-0CFF6BF25D89'

select tp_UIVersion, * from alluserdata where tp_ListID = 'C8AC0F90-1F7B-4EFB-95A1-0CFF6BF25D89' 

--select * from AllDocs where ListId = 'E4C40C32-CE85-46FD-A4D5-5508B514DB7C' and Id = 'DF7F3B2E-786C-4499-B4A4-210D20684E40'
select * from alldocversions where 
--UIVersion = 1536 and InternalVersion = 769 and
Id = 'E98889B5-C0BF-4C3B-BA0D-010AFDC170FF'

select * from webs

select * from alldocstreams where Id = '5F64D137-9309-43F8-BB13-ADD20B8129B4'

SELECT docs.LeafName as Name,*,  tp_Id, nvarchar4 as 'Status',datetime1 as 'StartDate',tp_Modified as 'Modified',int1 as 'Predecessors',nvarchar3 as 'Priority',float1 as 'PercentComplete',
datetime2 as 'DueDate',ntext2 as 'Body',tp_Created as 'Created',ntext1 as '_ModerationComments',nvarchar1 as 'Title',nvarchar2 as 'File_x0020_Type',int2 as 'AssignedTo',int3 as 'TaskGroup' 
FROM AllUserData ad, allDocs docs
WHERE ad.tp_ListId = 'C8AC0F90-1F7B-4EFB-95A1-0CFF6BF25D89' AND ad.tp_DocID = docs.id and 
ad.tp_Version = (select max(tp_Version) from AllUserData ad1 
where tp_ListID = 'C8AC0F90-1F7B-4EFB-95A1-0CFF6BF25D89' and ad.tp_ID = ad1.tp_ID) 


SELECT DISTINCT ad.tp_Version AS InternalVersion, alldoc.DirName, alldoc.LeafName, ads.Content
FROM AllUserData ad, AllDocVersions adv, AllDocStreams ads, AllDocs alldoc
WHERE ad.tp_ListId = '2B155C1E-AF74-4457-A665-DE442A41669C' and ad.tp_Id = 2 and ad.tp_Version = 3
AND ad.tp_DocID = adv.Id
AND ads.Id = ad.tp_DocId
AND ads.InternalVersion = adv.InternalVersion
AND ad.tp_UIVersion = adv.UIVersion
AND alldoc.Id = ad.tp_DocId

UNION

SELECT Top 1 ad.InternalVersion, ad.DirName, ad.LeafName, ads.Content 
FROM AllDocs ad, AllDocStreams ads
WHERE ad.ID = '5F64D137-9309-43F8-BB13-ADD20B8129B4' AND ad.Id = ads.Id and ContentVersion = 3
ORDER BY InternalVersion DESC

SELECT TOP 1 max(ads.InternalVersion) as InternalVersion, ad.DirName, ad.LeafName, ads.Content 
FROM AllDocs ad, AllDocStreams ads WHERE ad.SiteId = ads.SiteId AND ad.Id = ads.Id AND ads.Content IS NOT NULL 
AND ad.Id = '5f64d137-9309-43f8-bb13-add20b8129b4'GROUP BY ad.DirName, ad.LeafName, ads.Content ORDER BY InternalVersion DESC
 

SELECT DISTINCT ad.tp_Version AS InternalVersion, alldoc.DirName, alldoc.LeafName, ads.Content 
FROM AllUserData ad, AllDocVersions adv, AllDocStreams ads, AllDocs alldoc 
WHERE ad.tp_ListId = '2b155c1e-af74-4457-a665-de442a41669c' and ad.tp_Id = 2 AND ad.tp_Version = 2 AND ad.tp_DocID = adv.Id AND ads.Id = ad.tp_DocId 
AND ads.InternalVersion = adv.InternalVersion AND ad.tp_UIVersion = adv.UIVersion AND alldoc.Id = ad.tp_DocId 

UNION 

SELECT TOP 1 max(ads.InternalVersion) as InternalVersion, ad.DirName, ad.LeafName, ads.Content FROM AllDocs ad, AllDocStreams ads 
WHERE ad.SiteId = ads.SiteId AND ad.Id = ads.Id AND ads.Content IS NOT NULL AND ad.Id = '5f64d137-9309-43f8-bb13-add20b8129b4' AND ad.ContentVersion = 3
GROUP BY ad.DirName, ad.LeafName, ads.Content ORDER BY InternalVersion DESC


SELECT TOP 1 max(ads.InternalVersion) as InternalVersion, ad.DirName, ad.LeafName, ads.Content FROM AllDocs ad, AllDocStreams ads 
WHERE ad.SiteId = ads.SiteId AND ad.Id = ads.Id AND ads.Content IS NOT NULL AND ad.Id = 'df7f3b2e-786c-4499-b4a4-210d20684e40' 
--AND ad.ContentVersion = 8 
GROUP BY ad.DirName, ad.LeafName, ads.Content ORDER BY InternalVersion DESC