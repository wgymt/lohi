CREATE TABLE book
(
    book_id         INT PRIMARY KEY,
    channel_book_id VARCHAR(20) UNIQUE,
    book_name       VARCHAR(100),
    cate_id         INT,
    cate_name       VARCHAR(50),
    channel_type    INT,
    author_name     VARCHAR(50),
    chapter_num     INT,
    is_publish      INT,
    status          INT,
    create_time     DATETIME,
    cover           VARCHAR(300),
    intro           TEXT,
    word_count      INT,
    update_time     DATETIME,
    created         DATETIME    DEFAULT CURRENT_TIMESTAMP,
    showed          BOOLEAN     DEFAULT 0,
    source          VARCHAR(50),
    ranking         INT,
    short_des       VARCHAR(50) DEFAULT '',
    collect_count   INT         DEFAULT 0,
    heat            INT         DEFAULT 0
);
CREATE INDEX ix_book_cate_id ON book (cate_id);
CREATE INDEX ix_book_channel_type ON book (channel_type);

CREATE TABLE book_big_category
(
    cate_id   INT PRIMARY KEY,
    cate_name VARCHAR(50),
    channel   INT,
    showed    BOOLEAN  DEFAULT 1,
    icon      VARCHAR(100),
    created   DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE book_category
(
    cate_id   INT PRIMARY KEY,
    cate_name VARCHAR(50),
    showed    BOOLEAN  DEFAULT 1,
    icon      VARCHAR(100),
    created   DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE book_chapter_content
(
    id         INT PRIMARY KEY,
    book_id    INT,
    volume_id  INT,
    chapter_id INT,
    content    MEDIUMTEXT,
    created    DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX ix_book_id_chapter_id ON book_chapter_content (book_id, chapter_id);

CREATE TABLE book_chapters
(
    id           INT PRIMARY KEY,
    book_id      INT,
    volume_id    INT,
    chapter_id   INT,
    chapter_name VARCHAR(100),
    word_count   INT,
    create_time  DATETIME,
    update_time  DATETIME,
    created      DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX ix_book_chapters_book_id ON book_chapters (book_id);
CREATE INDEX ix_book_chapters_chapter_id ON book_chapters (chapter_id);
CREATE INDEX ix_book_chapters_volume_id ON book_chapters (volume_id);
CREATE TABLE book_shelf
(
    id        INT PRIMARY KEY,
    book_id   INT,
    book_name VARCHAR(100),
    cover     VARCHAR(300),
    user_id   INT,
    created   DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated   DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX ix_book_id_user_id ON book_shelf (book_id, user_id);
CREATE INDEX ix_book_shelf_book_id ON book_shelf (book_id);
CREATE TABLE book_volume
(
    id            INT PRIMARY KEY,
    book_id       INT,
    volume_id     INT,
    volume_name   VARCHAR(100),
    create_time   DATETIME,
    chapter_count INT,
    update_time   DATETIME,
    created       DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX ix_book_volume_book_id ON book_volume (book_id);
CREATE INDEX ix_book_volume_volume_id ON book_volume (volume_id);
CREATE TABLE read_rate
(
    id           INT PRIMARY KEY,
    user_id      INT,
    book_id      INT,
    chapter_id   INT,
    chapter_name VARCHAR(100),
    rate         INT,
    created      DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE search_key_word
(
    id      INT PRIMARY KEY,
    keyword VARCHAR(100),
    count   INT,
    is_hot  BOOLEAN
);
CREATE TABLE user
(
    id                   INT PRIMARY KEY,
    openId               VARCHAR(128) UNIQUE,
    nickName             VARCHAR(50),
    gender               INT      DEFAULT 0,
    city                 VARCHAR(120),
    province             VARCHAR(120),
    country              VARCHAR(120),
    avatarUrl            VARCHAR(200),
    preference           INT      DEFAULT 0,
    brightness           INT      DEFAULT 30,
    fontSize             INT      DEFAULT 14,
    background           VARCHAR(10),
    turn                 VARCHAR(10),
    last_read            INT,
    last_read_chapter_id INT,
    modified             DATETIME DEFAULT CURRENT_TIMESTAMP,
    created              DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE book_category_relation
(
    id          INT PRIMARY KEY,
    big_cate_id INT,
    cate_id     INT,
    CONSTRAINT fk_big_cate_rel FOREIGN KEY (big_cate_id) REFERENCES book_big_category (cate_id),
    CONSTRAINT fk_cate_rel FOREIGN KEY (cate_id) REFERENCES book_category (cate_id)
);

CREATE TABLE browse_history
(
    id      INT PRIMARY KEY,
    user_id INT,
    book_id INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_browse_his_book FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_browse_his_user FOREIGN KEY (user_id) REFERENCES user (id)
);