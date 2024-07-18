/*
Split mimiciv_icu.icustays to Activity 
- Enter the ED
- Discharge from the ED
*/

-- STEP 2: Create icu_enter
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_enter` AS
SELECT 
  icu.stay_id,
  icu.subject_id,
  icu.hadm_id,
  "Enter the ICU" AS activity,
  icu.intime AS timestamps,
  icu.first_careunit AS category,
  "FinishedRunning" AS statusdescription,
  diag.icd_code,
  d_diag.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` icu
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` diag
ON 
  icu.subject_id = diag.subject_id AND icu.hadm_id = diag.hadm_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` d_diag
ON 
  diag.icd_code = d_diag.icd_code
WHERE 
  LOWER(d_diag.long_title) LIKE '%atrial fibrillation%'
ORDER BY 
  icu.stay_id;
  
-- STEP 3: Create icu_procedure_cardioversion
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_procedures_cardioversion` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  c.label AS activity, 
  b.starttime AS timestamps,
  c.label AS category, 
  b.statusdescription,
  e.icd_code, 
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.procedureevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid = 225464
ORDER BY 
  stay_id
  
-- STEP 4: Create icu_treatment_digoxin
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_digoxin` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  'Digoxin Infusion' AS activity, 
  b.starttime AS timestamps,
  c.label AS category, 
  b.statusdescription,
  e.icd_code, 
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.inputevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid = 229069
ORDER BY 
  stay_id
  
-- STEP 5: Create icu_treatment_beta-blockers
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_beta-blockers` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  'Beta-Blocker Therapy' AS activity, 
  b.starttime AS timestamps,
  c.label AS category, 
  b.statusdescription,
  e.icd_code, 
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.inputevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid IN(225974, 221429)
ORDER BY 
  stay_id

-- STEP 6: Create icu_treatment_calcium-channel_blockers
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_calcium-channel_blockers` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  'Calcium-Channel Blocker Therapy' AS activity, 
  b.starttime AS timestamps, 
  c.label AS category, 
  b.statusdescription,
  e.icd_code, 
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.inputevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid IN(222318, 221468)
ORDER BY 
  stay_id

--STEP 7: Create icu_treatment_amiodarone_cardioversion
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_treatment_amiodarone_cardioversion` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  'Amiodarone Cardioversion' AS activity, 
  b.starttime AS timestamps,
  c.label AS category, 
  b.statusdescription,
  e.icd_code, 
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.inputevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid IN(221347, 228339, 229654, 230034)
ORDER BY 
  stay_id
  
-- STEP 8: Anticoagulation
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_anticoagulation` AS
SELECT 
  a.stay_id, 
  a.subject_id, 
  a.hadm_id, 
  'Anticoagulation Treatment' AS activity, 
  b.starttime AS timestamps,  
  c.label AS category, 
  b.statusdescription,
  e.icd_code,
  e.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` as a
INNER JOIN 
  `physionet-data.mimiciv_icu.inputevents` as b
ON 
  a.stay_id = b.stay_id
INNER JOIN 
  `physionet-data.mimiciv_icu.d_items` as c
ON 
  b.itemid = c.itemid
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` as d
ON 
  a.subject_id = d.subject_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` as e
ON 
  d.icd_code = e.icd_code
WHERE 
  LOWER(e.long_title) LIKE '%atrial fibrillation%' 
  AND c.itemid = 225913
ORDER BY 
  stay_id

-- STEP 9: Create icu_discharge
CREATE OR REPLACE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_discharge` AS
SELECT 
  icu.stay_id,
  icu.subject_id,
  icu.hadm_id,
  "Discharge from ICU" AS activity,
  icu.outtime AS timestamps,
  icu.last_careunit AS category,
  "FinishedRunning" AS statusdescription,
  diag.icd_code,
  d_diag.long_title AS disease_name
FROM 
  `physionet-data.mimiciv_icu.icustays` icu
INNER JOIN 
  `physionet-data.mimiciv_hosp.diagnoses_icd` diag
ON 
  icu.subject_id = diag.subject_id AND icu.hadm_id = diag.hadm_id
INNER JOIN 
  `physionet-data.mimiciv_hosp.d_icd_diagnoses` d_diag
ON 
  diag.icd_code = d_diag.icd_code
WHERE 
  LOWER(d_diag.long_title) LIKE '%atrial fibrillation%'
ORDER BY 
  icu.stay_id;
