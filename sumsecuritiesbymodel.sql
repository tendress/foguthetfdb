SELECT M.name, SS.name, SE.ticker,  MSS.weight * SUM(SE.weight)
FROM models M 
INNER JOIN model_security_set MSS ON M.id = MSS.model_id
INNER JOIN security_sets SS ON MSS.security_set_id = SS.id
INNER JOIN security_sets_etfs SSE ON SS.id = SSE.security_set_id
INNER JOIN etfs E ON SSE.etf_id = E.id
INNER JOIN securities_etfs SE ON E.id = SE.etf_id
--WHERE M.name = 'Conservative Growth'
WHERE M.name = 'Conservative Value'
GROUP BY SE.ticker
ORDER BY MSS.weight * SUM(SE.weight) DESC;
