SELECT J.JobId,ISNULL(SUM(P.Price*OP.Quantity),0)
FROM Jobs AS J
LEFT JOIN Orders AS O ON J.JobId=O.JobId
LEFT JOIN OrderParts AS OP ON O.OrderId=OP.OrderId
LEFT JOIN Parts AS P ON OP.PartId=P.PartId
WHERE J.Status='Finished'
GROUP BY J.JobId
ORDER BY SUM(P.Price*OP.Quantity) DESC
,J.JobId




SELECT J.JobId,SUM(P.Price*OP.Quantity)
FROM Jobs AS J
LEFT JOIN PartsNeeded AS PN ON J.JobId=PN.JobId
LEFT JOIN Parts AS P ON PN.PartId=P.PartId
LEFT JOIN OrderParts AS OP ON P.PartId=OP.PartId
LEFT JOIN Orders AS O ON OP.OrderId=O.OrderId
WHERE J.Status='Finished'
GROUP BY J.JobId
ORDER BY SUM(P.Price*OP.Quantity) DESC
,J.JobId