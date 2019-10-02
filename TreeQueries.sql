select w.Title as SiteTitle, w.Id, w.ParentWebID, al.tp_Title as ListTitle
from Webs w, AllLists al
where w.Id = al.tp_WebId 
AND al.tp_ServerTemplate < 110
ORDER BY w.ParentWebId, al.tp_Title

SELECT * FROM AllLists

SELECT * FROM AllUserData