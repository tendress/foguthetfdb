--SQLite
SELECT S.ticker, S.name, SS.id, E.symbol, SE.weight, SS.name AS SecuritySet, M.name AS ModelName, MSS.weight FROM securities S 
INNER JOIN securities_etfs SE ON S.ticker = SE.ticker
INNER JOIN etfs E ON SE.etf_id = E.id
INNER JOIN security_sets_etfs SSE ON SSE.etf_id = E.id
INNER JOIN security_sets SS ON SSE.security_set_id = SS.id
INNER JOIN model_security_set MSS ON SS.id = MSS.security_set_id
INNER JOIN models M ON MSS.model_id = M.id
WHERE M.name = 'Momentum'
ORDER BY S.ticker;