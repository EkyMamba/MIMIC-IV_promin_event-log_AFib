CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimiciv_afib_finish.mimiciv_afib_unspecified` AS
SELECT DISTINCT
  stay_id,
  subject_id,
  hadm_id,
  activity,
  timestamps,
  category,
  statusdescription,
  icd_code,
  disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_af_eventlog`
WHERE icd_code = 'I4891'
ORDER BY stay_id, timestamps