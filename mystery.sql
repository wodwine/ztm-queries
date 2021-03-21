CREATE VIEW suspected_rider_names AS
SELECT DISTINCT 
            SPLIT_PART(u.name,' ',1) AS "first_name",
            SPLIT_PART(u.name,' ',2) AS "last_name"
FROM suspected_rides AS sr,rides AS r,users AS u
WHERE sr.ride_id = r.id AND u.id = r.rider_id

SELECT DISTINCT
       CONCAT(t1.first_name,' ',t1.last_name) AS "employee",
       CONCAT(rider.first_name,' ',rider.last_name) AS "rider"
FROM dblink('host=localhost user=postgres password=postgres dbname=Employees', 'SELECT first_name,last_name FROM employees;') AS t1(first_name NAME,last_name NAME)
JOIN suspected_rider_names AS rider ON t1.last_name = rider.last_name
ORDER BY "rider"