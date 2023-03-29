-- Create User table
CREATE TABLE User (
  Id INT NOT NULL AUTO_INCREMENT,     -- Primary key for the User table
  Name VARCHAR(255) NOT NULL,         -- User's name
  Photo VARCHAR(255),                 -- URL to User's photo
  Bio TEXT,                           -- User's biography
  UpdatedAt TIMESTAMP NOT NULL,       -- Timestamp for the last time the User was updated
  CreatedAt TIMESTAMP NOT NULL,       -- Timestamp for when the User was created
  PostsCounter INT NOT NULL DEFAULT 0,-- Counter for the number of Posts associated with the User
  PRIMARY KEY (Id)
);

-- Create Post table
CREATE TABLE Post (
  Id INT NOT NULL AUTO_INCREMENT,     -- Primary key for the Post table
  AuthorId INT NOT NULL,              -- Foreign key to the User table
  Title VARCHAR(255) NOT NULL,        -- Post's title
  Text TEXT NOT NULL,                 -- Post's content
  CreatedAt TIMESTAMP NOT NULL,       -- Timestamp for when the Post was created
  UpdatedAt TIMESTAMP NOT NULL,       -- Timestamp for the last time the Post was updated
  CommentsCounter INT NOT NULL DEFAULT 0, -- Counter for the number of Comments associated with the Post
  LikesCounter INT NOT NULL DEFAULT 0,    -- Counter for the number of Likes associated with the Post
  PRIMARY KEY (Id),
  FOREIGN KEY (AuthorId) REFERENCES User(Id) -- Establishing a foreign key relationship with the User table
);

-- Create Comment table
CREATE TABLE Comment (
  AuthorId INT NOT NULL,              -- Foreign key to the User table
  PostId INT NOT NULL,                -- Foreign key to the Post table
  Text TEXT NOT NULL,                 -- Comment's content
  UpdatedAt TIMESTAMP NOT NULL,       -- Timestamp for the last time the Comment was updated
  CreatedAt TIMESTAMP NOT NULL,       -- Timestamp for when the Comment was created
  PRIMARY KEY (AuthorId, PostId, CreatedAt), -- Primary key with composite keys
  FOREIGN KEY (AuthorId) REFERENCES User(Id), -- Establishing a foreign key relationship with the User table
  FOREIGN KEY (PostId) REFERENCES Post(Id)   -- Establishing a foreign key relationship with the Post table
);

-- Create Like table
CREATE TABLE Like (
  AuthorId INT NOT NULL,              -- Foreign key to the User table
  PostId INT NOT NULL,                -- Foreign key to the Post table
  CreatedAt TIMESTAMP NOT NULL,       -- Timestamp for when the Like was created
  UpdatedAt TIMESTAMP NOT NULL,       -- Timestamp for the last time the Like was updated
  PRIMARY KEY (AuthorId, PostId),     -- Primary key with composite keys
  FOREIGN KEY (AuthorId) REFERENCES User(Id), -- Establishing a foreign key relationship with the User table
  FOREIGN KEY (PostId) REFERENCES Post(Id)   -- Establishing a foreign key relationship with the Post table
);
