SELECT P.PartId,
       P.Description,
	   PN.Quantity,
	   P.StockQty,
	  IIF(O.Delivered = 0, OP.Quantity, 0)
FROM PartsNeeded AS PN
LEFT JOIN Jobs AS J ON PN.JobId=J.JobId
LEFT JOIN Parts AS P ON PN.PartId=P.PartId
LEFT JOIN OrderParts AS OP ON P.PartId=OP.PartId
LEFT JOIN Orders AS O ON OP.OrderId=O.OrderId
WHERE J.Status<>'Finished' AND (P.StockQty +  IIF(O.Delivered = 0, OP.Quantity, 0))< PN.Quantity
