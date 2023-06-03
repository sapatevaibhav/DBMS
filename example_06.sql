-- I am working on this cursor program keep patience


-- code below is broken


















-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade VARCHAR(3)
);


DECLARE
   -- Implicit Cursor
   CURSOR c1 IS
      SELECT id, name, grade
      FROM Student;
      
   -- Explicit Cursor (UPDATE statement)
   CURSOR c2 IS
      SELECT id, grade
      FROM Student
      WHERE grade = 'C';
      
   -- Variable declarations
   v_id int;
   v_name varchar(20);
   v_grade varchar(3);
BEGIN
   -- Implicit Cursor (SELECT query)
   FOR std IN c1 LOOP
      DBMS_OUTPUT.PUT_LINE('Student ID: ' || std.id || ', Name: ' || std.name || ', Grade: ' || std.grade);
   END LOOP;
   
   -- Explicit Cursor (UPDATE statement)
   OPEN c2;
   LOOP
      FETCH c2 INTO v_id, v_grade;
      EXIT WHEN c2%NOTFOUND;
      v_grade := 'B'; -- Update the grade to 'B'
      UPDATE Student
      SET grade = v_grade
      WHERE id = v_id;
   END LOOP;
   CLOSE c2;

EXCEPTION
   WHEN OTHERS THEN
END;
/
