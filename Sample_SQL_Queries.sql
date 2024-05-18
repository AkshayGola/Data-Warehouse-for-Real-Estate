/* Sample SQL Queries on DW Schema of Real Estate Company */

-- Query 1: Find all property sales done in Pilani by agent
-- named Megha in the year 2020.
SELECT p.propertypk, p.city, a.agentname, s.saleprice,
       s.sellerbrokerage, s.buyerbrokerage, s.selleragentrating,
	   s.buyeragentrating
FROM sale s
JOIN property p ON s.propertyfk = p.propertypk
JOIN time t ON s.timefk = t.timepk
JOIN agent a ON s.agentfk = a.agentpk
WHERE p.city = 'Pilani'
AND a.agentname = 'Megha'
AND t.year = 2020
ORDER BY p.propertypk;

-- Query 2: Available properties for rent in 'Jhunjhunu' district of Rajasthan
-- in the year 2018
SELECT p.city, p.pincode, p.propertyarea, p.rooms, pt.description,
       t.date, t.month, t.year, q.quoteprice
FROM quotation q
JOIN property p ON q.propertyfk = p.propertypk
JOIN time t ON q.timefk = t.timepk
JOIN propertytype pt ON pt.propertytypepk = p.propertytypefk
WHERE (q.saleorrent = 0)
AND p.district = 'Churu'
AND t.year = 2020;

-- Query 3: Agents in descending order according to average rating given
-- by customers (considering both Sale and Rental data)
SELECT combined.AgentID "Agent ID", combined.AgentName "Agent Name",
       AVG(combined.Rating) as "Average Rating"
FROM (SELECT a.AgentID , a.AgentName,
      (CAST(s.selleragentrating as float) + CAST(s.buyeragentrating AS FLOAT))/2 AS Rating
      FROM sale s
      JOIN Agent a ON s.AgentFK = a.AgentPK
      UNION ALL
      SELECT a.AgentID , a.AgentName,
	  (CAST(r.landlordagentrating as float) + CAST(r.tenantagentrating AS FLOAT))/2 AS Rating
	  FROM rental r
      JOIN Agent a ON r.AgentFK = a.AgentPK) as combined
GROUP BY combined.AgentID, combined.AgentName
ORDER BY "Average Rating" DESC;


-- Query 4: Drill Down on location of property.
SELECT p.state , sum(s.Saleprice) AS sales_total FROM sale s
JOIN property p ON p.propertypk = s.propertyfk
GROUP BY p.state
ORDER by sum(s.Saleprice) DESC;

SELECT p.district , sum(s.Saleprice) AS sales_total  FROM sale s
JOIN property p ON p.propertypk = s.propertyfk
WHERE p.state = 'Rajasthan'
GROUP BY p.district
ORDER by sum(s.Saleprice) DESC;

SELECT p.city , sum(s.Saleprice) AS sales_total FROM sale s
JOIN property p ON p.propertypk = s.propertyfk
WHERE p.district = 'Jhunjhunu'
GROUP BY p.city
ORDER by sum(s.Saleprice) DESC;

-- Query 5: Roll-up of total brokerage obtained from Sale and Rent deals
-- with respect to state in 2020.
SELECT combined.state as "State", combined.month as "Month",
       sum(combined.TotalBrokerage) as "Total Brokerage"
FROM (SELECT p.state, t.month, (s.sellerbrokerage+s.buyerbrokerage) AS TotalBrokerage
      FROM sale s
      JOIN property p ON s.propertyfk = p.propertypk
      JOIN time t ON s.timefk = t.timepk
      WHERE t.year = 2020
      UNION ALL
      SELECT p.state, t.month, (r.landlordbrokerage+r.tenantbrokerage) AS TotalBrokerage
	  FROM rental r
      JOIN property p ON r.propertyfk = p.propertypk
      JOIN time t ON r.timefk = t.timepk
      WHERE t.year = 2020) AS combined
GROUP BY ROLLUP(combined.state, combined.month);
