-- STEP 1: Create icu_id table
-- Drop table if it exists (BigQuery doesn't support `DROP TABLE IF EXISTS`)
DROP TABLE IF EXISTS `mimic-iv-ekymamba-2002.mimic_insights.icu_id`;

-- Extract distinct IDs and insert into the new table
CREATE TABLE `mimic-iv-ekymamba-2002.mimic_insights.icu_id` AS
SELECT DISTINCT subject_id, hadm_id, stay_id
FROM `physionet-data.mimiciv_icu.icustays`;
