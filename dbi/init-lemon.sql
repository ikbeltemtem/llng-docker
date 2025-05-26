CREATE TABLE lmConfig (
    cfgNum integer not null primary key,
    data text
  );
  GRANT ALL PRIVILEGES ON TABLE lmConfig TO lemon;

  CREATE UNLOGGED TABLE sessions (
    id varchar(64) not null primary key,
    a_session jsonb
  );
  CREATE INDEX i_s__whatToTrace     ON sessions ((a_session ->> '_whatToTrace'));
  CREATE INDEX i_s__session_kind    ON sessions ((a_session ->> '_session_kind'));
  CREATE INDEX i_s__utime           ON sessions ((cast (a_session ->> '_utime' as bigint)));
  CREATE INDEX i_s_ipAddr           ON sessions ((a_session ->> 'ipAddr'));
  CREATE INDEX i_s__httpSessionType ON sessions ((a_session ->> '_httpSessionType'));
  CREATE INDEX i_s_user             ON sessions ((a_session ->> 'user'));
  GRANT ALL PRIVILEGES ON TABLE sessions TO lemon;
  
  
  
  CREATE TABLE poste_users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    mail VARCHAR(50),
    cin VARCHAR(50)
);
GRANT ALL PRIVILEGES ON TABLE poste_users TO lemon;

INSERT INTO poste_users (login, password, mail, cin) VALUES ('123456', '123456', 'user@example.com', '14395624');
INSERT INTO poste_users (login, password, mail, cin) VALUES ('ikbel', 'password', 'user2@example.com', '14395625');
