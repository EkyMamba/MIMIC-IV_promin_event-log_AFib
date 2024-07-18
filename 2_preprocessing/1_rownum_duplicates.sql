-- Remove Duplicate Data
-- Step 1: Create a temporary table with row numbers to identify duplicates
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_af_rownum` AS
SELECT
  *,
  ROW_NUMBER() OVER (
    PARTITION BY stay_id, subject_id, hadm_id, activity, timestamps 
    ORDER BY timestamps
  ) AS row_num
FROM
  `mimic-iv-ekymamba-2002.mimic_insights.icu_af_table`;
