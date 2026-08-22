SELECT
    e.name
FROM Employee AS e
JOIN Employee AS emp
    ON e.id = emp.managerId
GROUP BY
    e.id,
    e.name
HAVING COUNT(emp.id) >= 5;