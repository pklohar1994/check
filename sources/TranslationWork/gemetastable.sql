-- This script creates a table with 6 columns: code, english term, english definition, english scope note, spanish term and empty column
-- It does not provide the Spanish definitions
SET @secondlang = 'ru';

SELECT le.id_concept AS code, le.value AS english,
    de.value AS definition, se.value AS scopenote,
    ls.value AS spanish, "" AS translation
FROM property AS le
LEFT JOIN property AS de on le.ns=de.ns AND le.id_concept=de.id_concept AND de.langcode="en" AND de.name="definition"
LEFT JOIN property AS se on le.ns=se.ns AND le.id_concept=se.id_concept AND se.langcode="en" AND se.name="scopeNote"
LEFT JOIN property AS ls on le.ns=ls.ns AND le.id_concept=ls.id_concept AND ls.langcode=@secondlang AND ls.name="prefLabel"
WHERE le.ns=1 AND le.langcode="en" AND le.name="prefLabel"
ORDER BY le.id_concept
