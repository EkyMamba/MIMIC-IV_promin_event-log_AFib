-- Persistent Atrial Fibrillation
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimiciv_afib_finish.mimiciv_afib_persistent` AS
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
FROM `mimic-iv-ekymamba-2002.mimiciv_afib_finish.mimiciv_afib_eventlog`
WHERE icd_code = 'I481'
ORDER BY stay_id, timestamps
