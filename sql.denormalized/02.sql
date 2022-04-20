SELECT 
tag,
count(*) as count
FROM (SELECT t1.data->>'id' as id, 
          '#' || (jsonb_array_elements( COALESCE(t2.data->'entities'->'hashtags','[]') ||
          COALESCE(t2.data->'extended_tweet'->'entities'->'hashtags','[]'))->>'text') as tag 
      FROM tweets_jsonb t1 
      JOIN tweets_jsonb t2 on (t1.data->'id'=t2.data->'id') 
      WHERE t1.data->'entities'->'hashtags' @@ '$[*].text== "coronavirus" '
          OR    t1.data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus" '
      ) t
GROUP BY (1)
ORDER BY count DESC, tag
LIMIT 1000;
