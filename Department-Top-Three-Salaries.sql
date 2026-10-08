SELECT
    d.name AS Department,
    r.name AS Employee,
    r.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee
) AS r
JOIN Department AS d
    ON r.departmentId = d.id
WHERE r.rnk <= 3;