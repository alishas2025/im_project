-- Select the role, warehouse, database & schema
USE ROLE ROLE_MALLARD;
USE WAREHOUSE ANIMAL_TASK_WH;
USE DATABASE DB_MALLARD;
Use Schema HOMEWORKS;
USE DB_MALLARD.HOMEWORKS;


-- Create a new Snowflake stage with server-side encryption enabled
CREATE OR REPLACE STAGE DB_MALLARD.HOMEWORKS.test_docs
    ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

-- To check if test files are uploaded correctly, List all files stored inside the test_docs stage
LIST @DB_MALLARD.HOMEWORKS.TEST_DOCS;

SELECT 
  HW4_MALLARD_AIRBNB_MODEL! PREDICT(
        GET_PRESIGNED_URL('@DB_MALLARD.HOMEWORKS.TEST_DOCS', RELATIVE_PATH),
        1
    ) AS PREDICTED_VALUES
FROM DIRECTORY('@DB_MALLARD.HOMEWORKS.TEST_DOCS');