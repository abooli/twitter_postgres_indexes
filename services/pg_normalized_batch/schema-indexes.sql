CREATE EXTENSION pg_trgm;
CREATE EXTENSION btree_gin;

CREATE INDEX ON tweet_tags(tag);
CREATE INDEX ON tweets(lang);
CREATE INDEX ON tweet_tags(id_tweets);
CREATE INDEX ON tweet_tags(tag, id_tweets);
CREATE INDEX ON tweet_tags(id_tweets, tag);
CREATE INDEX ON tweets USING gin(to_tsvector('english',text));
