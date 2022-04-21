/*
 * Calculates the hashtags that are commonly used for English tweets containing the word "coronavirus"
 */

--SELECT
--    count(*)
--FROM tweets
--WHERE to_tsvector('english',text)@@to_tsquery('english','coronavirus')
--  AND lang='en'
--;

/*
SELECT count(*)
FROM tweets_jsonb 
WHERE (to_tsvector('english', data->'extended_tweet'->'full_text') @@ to_tsquery('english', 'coronavirus')
   OR to_tsvector('english', data->'text') @@ to_tsquery('english', 'coronavirus'))
    AND data->>'lang'='en'
;
*/
