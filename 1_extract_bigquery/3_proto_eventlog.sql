-- STEP 10
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_af_table` AS
-- icu_enter
SELECT
  af.stay_id,
  en.subject_id,
  af.hadm_id,
  en.activity,
  en.timestamps,
  en.category,
  en.statusdescription,
  en.icd_code,
  en.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_enter` en
ON af.stay_id = en.stay_id
UNION ALL

-- digoxin
SELECT
  af.stay_id,
  dg.subject_id,
  af.hadm_id,
  dg.activity,
  dg.timestamps,
  dg.category,
  dg.statusdescription,
  dg.icd_code,
  dg.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_digoxin` dg
ON af.stay_id = dg.stay_id
UNION ALL

-- beta-blockers
SELECT
  af.stay_id,
  bt.subject_id,
  af.hadm_id,
  bt.activity,
  bt.timestamps,
  bt.category,
  bt.statusdescription,
  bt.icd_code,
  bt.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_beta-blockers` bt
ON af.stay_id = bt.stay_id
UNION ALL

-- calcium-channel blockers
SELECT
  af.stay_id,
  cl.subject_id,
  af.hadm_id,
  cl.activity,
  cl.timestamps,
  cl.category,
  cl.statusdescription,
  cl.icd_code,
  cl.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_calcium-channel_blockers` cl
ON af.stay_id = cl.stay_id
UNION ALL

-- cardioversion
SELECT
  af.stay_id,
  cd.subject_id,
  af.hadm_id,
  cd.activity,
  cd.timestamps,
  cd.category,
  cd.statusdescription,
  cd.icd_code,
  cd.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_procedures_cardioversion` cd
ON af.stay_id = cd.stay_id
UNION ALL

-- amiodarone cardioversion
SELECT
  af.stay_id,
  am.subject_id,
  af.hadm_id,
  am.activity,
  am.timestamps,
  am.category,
  am.statusdescription,
  am.icd_code,
  am.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_amiodarone_cardioversion` am
ON af.stay_id = am.stay_id
UNION ALL

-- icu_discharge
SELECT
  af.stay_id,
  ds.subject_id,
  af.hadm_id,
  ds.activity,
  ds.timestamps,
  ds.category,
  ds.statusdescription,
  ds.icd_code,
  ds.disease_name
FROM `mimic-iv-ekymamba-2002.mimic_insights.icu_id` af
INNER JOIN `mimic-iv-ekymamba-2002.mimic_insights.icu_discharge` ds
ON af.stay_id = ds.stay_id
ORDER BY stay_id, timestamps;
