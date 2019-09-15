DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS posts;

CREATE TABLE posts(
  id UUID PRIMARY KEY,
  topic VARCHAR(255) UNIQUE NOT NULL
);
CREATE TABLE tags(
  id UUID PRIMARY KEY,
  text VARCHAR(255) UNIQUE NOT NULL,
  post_id UUID REFERENCES posts(id)
);
INSERT INTO posts(id, topic) VALUES('e4d3fdab-00ca-4c1e-abd2-a24cbbe01a66','Node');
INSERT INTO posts(id, topic) VALUES('985b402f-b6a3-4f0a-8bb9-860662620415','Express');
INSERT INTO posts(id, topic) VALUES('ebaae031-4147-4189-b3a8-de344e528231','React');

INSERT INTO tags(id, text, post_id) VALUES('a1eb855a-1dd3-4aec-9dd7-aff78be20d0e','Challenging','985b402f-b6a3-4f0a-8bb9-860662620415');
INSERT INTO tags(id, text, post_id) VALUES('fe5a1929-78f2-4c94-a78c-d548952981ea','Loved it!','ebaae031-4147-4189-b3a8-de344e528231');
INSERT INTO tags(id, text, post_id) VALUES('54f43c6b-56a1-4a58-92fb-7a8147ad8eef','What???','ebaae031-4147-4189-b3a8-de344e528231');

SELECT tags.text, posts.topic
FROM tags
JOIN posts
On tags.post_id = posts.id
