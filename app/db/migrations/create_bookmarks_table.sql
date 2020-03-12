CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);

CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));

CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));
CREATE TABLE bookmarks_tags(tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));
