--Task 1

CREATE TABLE layiheler(
    layihe_id NUMBER(4) PRIMARY KEY,
    layihe_kodu CHAR(6),
    layihe_adi VARCHAR2(50),
    budce NUMBER(8,2)
);
--Task 2 

INSERT INTO layiheler VALUES(1, 'A555', 'Test layihesi', 123456.789);
SELECT * FROM layiheler;
--Oracle 3-cü rəqəmə əsasən yuvarlaqlaşdırma aparır.

CREATE TABLE sobeler (
    sobe_id   number(5, 2) PRIMARY KEY,
    sobe_adi  char(30)
);
-- number vs int, -- int (38), 
-- varchar2 vs varchar vs char 

CREATE TABLE isciler (
    isci_id  NUMBER PRIMARY KEY,  -- 1) 
    ad       VARCHAR2(30),
    sobe_id  NUMBER
);
INSERT INTO sobeler VALUES (10, 'IT');
INSERT INTO sobeler VALUES (20, 'HR');
INSERT INTO sobeler VALUES (30, 'Finance');

INSERT INTO isciler VALUES (1, 'Aysel', 10);
INSERT INTO isciler VALUES (2, 'Murad', 20);
INSERT INTO isciler VALUES (3, 'Nigar', 20);
INSERT INTO isciler VALUES (4, 'Leyla', NULL); 
SELECT * FROM sobeler;
SELECT * FROM isciler;

--Task 3

SELECT LENGTH (sobe_adi), VSIZE(sobe_adi)
FROM sobeler
WHERE sobe_adi = 'IT';
--Çünki CHAR(30) sabit uzunluqludur və həmişə 30 simvolluq yer ayırır.

--Task 4

SELECT ad FROM isciler
WHERE sobe_id IS NULL;

--Task 5

SELECT s.sobe_adi
FROM sobeler s
WHERE EXISTS(SELECT 1
             FROM isciler i
             WHERE s.sobe_id=i.sobe_id);

--Task 6 

SELECT sobe_adi
FROM sobeler
WHERE sobe_id NOT IN(SELECT sobe_id
                     FROM isciler
                     WHERE sobe_id IS NOT NULL);

SELECT s.sobe_adi
FROM sobeler s
WHERE NOT EXISTS(SELECT 1
             FROM isciler i
             WHERE s.sobe_id=i.sobe_id);


--Task 7

SELECT DEPARTMENT_NAME 
FROM HR.DEPARTMENTS D
WHERE NOT EXISTS(SELECT DEPARTMENT_ID
                 FROM HR.EMPLOYEES E
                 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID);

--Task 8

SELECT FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES M
WHERE EXISTS (SELECT 1
              FROM HR.EMPLOYEES E
              WHERE M.EMPLOYEE_ID = E.MANAGER_ID);


--Task 9

SELECT TO_DATE('25/12/2024 14:30:00', 'DD/MM/YYYY HH24:MI:SS')
FROM DUAL;

--Task 10

SELECT TO_DATE('2025-Nov-09 09:15 PM', 'YYYY-MON-DD HH:MI PM', 'NLS_DATE_LANGUAGE=ENGLISH')
FROM DUAL;

-- Task 11

SELECT FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE
FROM HR.EMPLOYEES
WHERE HIRE_DATE > DATE '2007-01-01'
AND SALARY > 8000
ORDER BY HIRE_DATE DESC;

--Task 12

SELECT FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN DATE '2005-01-01'
                    AND DATE '2005-12-31';

--Task 13

SELECT TO_CHAR(HIRE_DATE, 'DD.MM.YYYY')
FROM HR.EMPLOYEES
FETCH FIRST 10 ROWS ONLY;

--Task 14

SELECT ADD_MONTHS (HIRE_DATE, 3) AS SINAQ_BITME_TARIXI
FROM HR.EMPLOYEES;

--Task 15

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM HR.EMPLOYEES
WHERE EXTRACT(MONTH FROM HIRE_DATE) = 5;
