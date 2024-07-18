-- Step 2: Select only the unique records by filtering out duplicates
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_af_eventlog` AS
SELECT
  stay_id,
  subject_id,
  hadm_id,
  activity,
  timestamps,
  category,
  statusdescription,
  icd_code,
  disease_name
FROM
  `mimic-iv-ekymamba-2002.mimic_insights.icu_af_rownum`
WHERE
  row_num = 1
ORDER BY
  stay_id, timestamps;
