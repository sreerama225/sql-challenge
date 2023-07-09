--------------- Drop and create new tables, columns as per the csv files --------------

DROP table salaries;
DROP table dept_emp;
DROP table dept_manager;
DROP table employees;
DROP table departments;
DROP table titles;

------------------### Employees Table - START ###-----------------
-- In Employees table EMP_NO is the primary key
-- emp_title_id is the foriegn key on titles.title_id

CREATE TABLE employees(
	emp_no 			INT			PRIMARY KEY,
	emp_title_id 		VARCHAR(10)		NOT NULL,
	birth_date 		DATE,
	first_name 		VARCHAR(30),
	last_name 		VARCHAR(30),
	sex				CHAR(1),
	hire_date		DATE
);

-------------------### Employees Table - END ###------------------

------------------### SALARIES Table - START ###-----------------

-- Emp_no is the primary key in salaries table
-- Emp_no is the foriegn key on employees.emp_no

CREATE TABLE salaries(
	emp_no			INT		PRIMARY KEY,
	salary			INT		NOT NULL
);

-------------------### SALARIES Table - END ###------------------

------------------### TITLES Table - START ###-----------------

-- title_id is the primary key in titles table

CREATE TABLE titles(
	title_id		VARCHAR(10)		PRIMARY KEY,
	title			VARCHAR(25)		NOT NULL
);

-------------------### TITLES Table - END ###------------------


------------------### DEPARTMENTS Table - START ###-----------------

-- dept_no is the primary key in departments table

CREATE TABLE departments(
	dept_no			VARCHAR(5)		PRIMARY KEY,
	dept_name		VARCHAR(25)		NOT NULL
);

-------------------### DEPARTMENTS Table - END ###------------------


------------------### DEPT_EMP Table - START ###-----------------

-- dept_no and emp_no are the primary key in dept_emp table
-- dept_no is foriegn key on departments.dept_no
-- emp_no is foriegn key on employees.emp_no

CREATE TABLE dept_emp(
	emp_no			INT,
	dept_no			VARCHAR(5),
	PRIMARY KEY(emp_no, dept_no)
);

-------------------### DEPT_EMP Table - END ###------------------

------------------### DEPT_EMP Table - START ###-----------------

-- dept_no and emp_no are the primary key in dept_manager table
-- dept_no is foriegn key on departments.dept_no
-- emp_no is foriegn key on employees.emp_no

CREATE TABLE dept_manager(
	dept_no			VARCHAR(5),
	emp_no			INT,
	PRIMARY KEY(dept_no, emp_no)
);

-------------------### DEPT_EMP Table - END ###------------------

-------------------### Foreign Key constraints - START ###-----------------

ALTER TABLE ONLY salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON UPDATE CASCADE ON DELETE RESTRICT;

--------------------### Foreign Key constraints - END ###------------------
