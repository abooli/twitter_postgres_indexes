SELECT count(*)
FROM (
    SELECT DISTINCT ctid, hashtag
    FROM (
        SELECT ctid, jsonb_array_elements(data->'entities'->'hashtags')->>'text' as hashtag
        FROM tweets_jsonb
        UNION ALL
        SELECT ctid, jsonb_array_elements(data->'extended_tweet'->'entities'->'hashtags')->>'text' as hashtag
        FROM tweets_jsonb
    )t
    WHERE hashtag @@ '#coronavirus'
)t;
