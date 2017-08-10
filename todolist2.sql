
-- Create a Table
CREATE TABLE todos(
   id SERIAL PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   details CHAR(1000),
   priority INT DEFAULT 1 NOT NULL,
   created_at TIMESTAMP NOT NULL,
   completed_at TIMESTAMP
);

-- Add 5 todo items
insert INTO todos (title, details, priority, created_at) VALUES
  ('Take out trash', 'Dump borther into trash bec. he is trash', 2, now()),
  ('Mop Yard', 'Get rid of all the moles with this great mop', 10, now()),
  ('Power wash the tub', 'get all the danky grime off them grout bubbles...yo!', 2.5, now()),
  ('Listen to Friday', 'Gouge out eye balls while vomiting terrible lip sounds', 5, now()),
  ('Rake the leaves', 'Cut my foot while raking the leaves bec. my Dad never taught me how to do it the right way', 3, now()),
  ('Take out trash', 'Dump borther into trash bec. he is trash', 2, now()),
  ('Mop', 'Get rid of all the moles with this great mop', 1, now()),
  ('Power', 'get all the danky grime off them grout bubbles...yo!', 1, now()),
  ('Listen', 'Gouge out eye balls while vomiting terrible lip sounds', 5, now()),
  ('Rake', 'Cut my foot while raking the leaves', 1, now());

-- Select only uncompleted tasks
SELECT * FROM todos
  WHERE completed_at is NULL;

-- Select items with priority level above 1
SELECT * FROM todos
  WHERE priority > 1;

-- Update a item to complete that was not already complete
UPDATE todos SET completed_at = now() WHERE id = 1;

-- Delete todos that have been completed_at
DELETE FROM todos WHERE completed_at is not null;

-- =========  Second Daily for Todos ============

-- Select all incomplete todos with priority 3
SELECT * FROM todos
  WHERE priority = 3 AND completed_at IS NULL;

-- Find the number of incomplete todos by priority
SELECT count(*) FROM todos WHERE completed_at is NULL GROUP BY priority;

-- Find the number of todos by priority created in the last 30 days
SELECT count(*) FROM todos where created_at > (CURRENT_DATE - INTERVAL '30 days') GROUP BY priority;

-- Find the next todo you should complete with the highest priority that was crated first
SELECT * FROM todos WHERE created_at = (SELECT min(created_at) FROM todos WHERE priority = 1 AND completed_at IS NULL);
