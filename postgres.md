# Postgres

## Installing

### Install on your machine

- List **key** packages

    ```bash
    postgresql-12 ("postgresql-contrib-12" is a virtual package)
        libpq5
        postgresql-client-12
        postgresql-client-common
        postgresql-common

    postgresql-server-dev-12
        libpq-dev
            libpqxx-4.0
            libpqxx-dev

    # OPTIONAL
    postgresql-doc-12

    # OPTIONAL
    pgadmin4
    ```

- Steps

    - [Linux downloads (Ubuntu)](https://www.postgresql.org/download/linux/ubuntu/)

    - Import repository signing key

        ```bash
        $ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        ```

    - Add repository contents to your `Ubuntu`

        ```bash
        $ RELEASE=$(cat /etc/upstream-release/lsb-release | grep DISTRIB_CODENAME | cut -d'=' -f2)
        $ echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee /etc/apt/sources.list.d/pgdg.list
        # e.g.
        $ echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
        # or
        $ sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
        ```

    - Verify repository links

        ```bash
        $ cat /etc/apt/sources.list.d/pgdg.list
        ```

    - Update packages

        ```bash
        $ sudo apt update
        ```

    - Install `postgresql-X.X` package

        ```bash
        $ sudo apt -y install postgresql-X.X
        # e.g.
        $ sudo apt -y install postgresql-12
        ```

    - `(Optional)` Allow access to PostgreSQL from remote hosts

        ```bash
        # 1. check sockets on port 5432
        $ sudo ss -tunelp | grep 5432

        # 2. change postgres conf
        $ sudo nano /etc/postgresql/12/main/postgresql.conf
        # replace line below
        listen_addresses = 'localhost'
        # to
        listen_addresses = '*'

        # 3. restart "postgresql" service
        $ sudo systemctl restart postgresql

        # 4. check sockets on port 5432 again
        $ sudo ss -tunelp | grep 5432

        # 5. if using firewall, allow port 5432
        $ sudo ufw allow 5432/tcp
        ```

    - `(Optional)` Creating a New Role

        ```bash
        # option 1
        $ sudo --login --user=postgres
        createuser --interactive

        # option 2
        $ sudo -u postgres createuser --interactive
        ```

    - `(Optional)` Creating a New Database

        ```bash
        # option 1
        $ sudo --login --user=postgres
        createdb {{ database name }}
        # e.g.
        createdb mydb

        # option 2
        $ sudo -u postgres createdb {{ database name }}
        # e.g.
        $ sudo -u postgres createdb mydb
        ```

    - `(Optional)` Opening a Postgres Prompt with the New Role

        ```bash
        # 1. add "myuser" role (linux user)
        $ sudo adduser {{ user name }}
        # e.g.
        $ sudo adduser myuser

        # 2. login with "myuser" user & run psql
        # option 1
        $ sudo -i -u myuser
        psql
        # option 2
        $ sudo -u myuser psql
        ```

### Install with Docker

- Download `postgres` images

    ```bash
    # latest version: 12.2
    $ docker pull postgres:12.2
    $ docker pull postgres:12.2-alpine
    ```

- Info about Environment Variable

    - `POSTGRES_PASSWORD`

        > REQUIRED
        > </br> sets the superuser password for PostgreSQL
        > </br> default superuser is defined by the POSTGRES_USER environment variable
        > </br> sets up trust authentication locally so you may notice a password is not required when connecting from localhost
        > </br> password will be required if connecting from a different host/container
        > </br> variable defines the superuser password in the PostgreSQL instance
        > </br> has no effect on the PGPASSWORD environment variable that may be used by the psql client at runtime

    - `POSTGRES_USER`

        > OPTIONAL
        > </br> used with POSTGRES_PASSWORD to set a "user" and its "password" on PostgreSQL
        > </br> create the specified user with superuser power
        > </br> create database with the same name
        > </br> If it is not specified, then the default user of "postgres" will be used
        > </br> "postgres" user from linux system is diff from "postgres" user inside database

- Testing Enviroment Variables

    ```bash
    # 1. create container with postgres
    $ docker run \
        --name mypg \
        --env POSTGRES_PASSWORD=mypass \
        --env POSTGRES_USER=myuser \
        --env POSTGRES_DB=mydb \
        --detach \
        postgres:12.2

    # 2. connect to postgres container, using "postgres" user (linux user not postgres cluster user)
    $ docker exec -it --user=postgres mypg bash

    # 3. change policies on pg_hba.conf (/var/lib/postgresql/data/pg_hba.conf)
    echo "
    local   all             all                                     md5
    host    all             all             127.0.0.1/32            trust
    host    all             all             ::1/128                 trust
    local   replication     all                                     trust
    host    replication     all             127.0.0.1/32            trust
    host    replication     all             ::1/128                 trust
    host    all             all             all                     md5
    " > /var/lib/postgresql/data/pg_hba.conf

    # 4. restart container
    $ docker restart mypg

    # 5. connect to postgres container, using "postgres" user (linux user not postgres cluster user)
    $ docker exec -it --user=postgres mypg bash

    # 6. enter psql
    $ psql --username=myuser --dbname=mydb

    # step 7 enter password
    ```

- Use it with docker

    ```bash
    # 1. create postgres container
    $ docker run \
        --name mypg \
        --env POSTGRES_PASSWORD=mypass \
        --env POSTGRES_USER=myuser \
        --env POSTGRES_DB=mydb \
        --user postgres \
        --rm \
        --detach \
            postgres:12.2

    # 2. enter it
    $ docker exec \
        --interactive \
        --tty \
            mypg \
                psql \
                    --username=myuser \
                    --dbname=mydb

    # 3. stop it if not needed anymore
    $ docker stop mypg
    ```

## Usage

- Connection Strings

    ```bash
    # -- flask
    $ psql postgresql://{{ user }}:{{ password }}@{{ ip }}:{{ port }}/{{ db_name }}

    # -- django
    $ psql postgres://{{ user }}:{{ password }}@{{ ip }}:{{ port }}/{{ db_name }}
    ```

- See all connections to database

    ```sql
    SELECT *
    FROM pg_stat_activity;
    ```

- Show versions

    ```sql
    SELECT version();
    SHOW all;
    SHOW server_version;
    ```

- Gargabe collector and statistics

    ```sql
    -- whole database
    VACUUM;
    ANALYZE;
    VACUUM ANALYZE;

    -- per table
    VACUUM {{ table name }};
    ANALYZE {{ table name }};
    VACUUM ANALYZE {{ table name }};
    -- e.g.
    VACUUM ANALYZE myusers;
    ```

- Extract info from db

    ```sql
    -- extract data from a table
    \COPY {{ table name }} TO '{{ /path/to/file }}' csv header;
    -- e.g
    \COPY myusers TO 'myusers.csv' csv header;

    -- extract data from all tables
    \COPY {SELECT * FROM * WHERE *} TO '{{ /path/to/file }}' csv header;
    -- e.g.
    \COPY {SELECT * FROM * WHERE *} TO 'alldata.csv' csv header;
    ```

- `psql` commands

    ```bash
    # disable pagination but retain the output
    \pset pager off

    # To see all objects in the database regardless of visibility
    # use *.* as the pattern.
    # supply a pattern or the S modifier to include system objects.

    # If \d is used without a pattern argument
    # it is equivalent to \dtvmsE which will show a list of all
    # visible tables, views, materialized views, sequences and foreign tables.
    # This is purely a convenience measure.

    # connect to database
    \c {{ database name }}
    # e.g.
    \c mydb

    # list databases
    \l+ *.*

    # list users
    \du+ *.*

    # list relations: tables, views, indexes, sequences
    \d+
    # show info about a relation
    \d+ {{ relation name }}
    # include system objetcs
    \dS+ *.*

    # list tables
    \dt+ *.*

    # list installed extensions
    \dx+ *.*

    # list views
    \dv+ *.*

    # list materialized views
    \dm+ *.*

    # list of schemas (namespaces)
    \dn *.*

    # show connection string
    \conninfo

    # change password of specified user
    \password [ username ]
    ```

- show current database

    ```sql
    SELECT current_database();
    ```

- list available extensions

    ```sql
    SELECT * FROM pg_available_extensions;
    ```

- get path to `pg_hba.conf` file

    ```sql
    SHOW hba_file;
    ```

- get path to `postgresql.conf` file

    ```sql
    SHOW config_file;
    ```

- Use of sudo to login
    - [difference between "sudo su - postgres" and "sudo -u postgres"?](https://serverfault.com/a/601141)
    - [Is “sudo su -” considered a bad practice?](https://serverfault.com/a/619152/383797)

    ```bash
    # embrace
    sudo -i -u {{ linux user }}
    sudo -i -u postgres
    sudo --login --user=postgres
    sudo -u {{ linux user }} {{ command }}
    sudo -u postgres psql
    sudo --user=postgres psql
    sudo -u {{ linux user }} psql --dbname={{ db name }}
    sudo -u postgres psql --dbname=postgres

    # avoid
    sudo su - postgres
    ```

- [change password](https://stackoverflow.com/a/12721095/3889948)

    ```sql
    ALTER USER {{ postgresql user }} WITH PASSWORD '{{ password you want }}';
    ALTER USER {{ postgresql user }} WITH ENCRYPTED PASSWORD '{{ password you want }}';
    ```

- [pg_hba.conf file](https://www.postgresql.org/docs/12/auth-pg-hba-conf.html)

- Show index definiton

    ```sql
    -- option 1
    \d {{ index name }}

    -- option 2
    -- https://www.postgresql.org/docs/11/view-pg-indexes.html
    SELECT indexdef FROM pg_indexes WHERE indexname = '{{ index name }}';
    ```

- List indices

    ```sql
    SELECT * FROM pg_indexes WHERE indexname = '{{ index name }}';
    ```

- List index statistics

    ```sql
    SELECT * FROM pg_stat_user_indexes WHERE indexrelname= '{{ index name }}';
    SELECT * FROM pg_statio_user_indexes WHERE indexrelname= '{{ index name }}';
    ```

- [Session Information Functions](https://www.postgresql.org/docs/12/functions-info.html)

    ```sql
    CHECK current user

    SELECT user;

    SELECT session_user;

    SET ROLE {{ new role }}
    ```

- Show configuration parameters values for tunning

    ```sql
    SHOW autovacuum_max_workers;
    SHOW autovacuum_vacuum_scale_factor;
    SHOW autovacuum_vacuum_threshold;
    SHOW checkpoint_completion_target;
    SHOW default_statistics_target;
    SHOW effective_cache_size;
    SHOW effective_io_concurrency;
    SHOW maintenance_work_mem;
    SHOW max_connections;
    SHOW max_parallel_workers_per_gather;
    SHOW max_wal_senders;
    SHOW max_wal_size;
    SHOW max_worker_processes;
    SHOW shared_buffers;
    SHOW work_mem;
    ```

- Check if database is in recovery mode

    ```sql
    SELECT pg_is_in_recovery();
    ```

- show all stats related to an specific view or table

    ```sql
    SELECT
        A.relid, A.indexrelid, A.indexrelname,
        A.idx_scan, A.idx_tup_read, A.idx_tup_fetch,
        B.idx_blks_read, B.idx_blks_hit
    FROM
        pg_stat_user_indexes A, pg_statio_user_indexes B
    WHERE
        A.indexrelid = B.indexrelid AND (
            A.indexrelname='{{view or table name}}' OR ...
        )
    ORDER BY
        idx_scan DESC;
    ```

- restart usage stats from a view or table (only in `DEV`)

    ```sql
    SELECT
        pg_stat_reset_single_table_counters(indexrelid)
    FROM
        pg_stat_user_indexes
    WHERE
        indexrelname='{{ view or table name}}' OR ...;
    ```

- show server process which handling current session (which state is not `idle`)

    ```sql
    SELECT
        datname,
        pid,
        usename,
        application_name,
        client_addr,
        client_hostname,
        client_port,
        backend_start,
        query_start,
        state_change,
        wait_event_type,
        wait_event,
        state,
        query,
        backend_type
    FROM
        pg_stat_activity
    WHERE
        state <> 'idle' AND
        pid <> pg_backend_pid();
    ```

### Configuration with django

- Option 1

    ```bash
    # 1. set `HOST` and don't set `PASSWORD` on DATABASES['default'] settings
    # 2. change these lines on `pg_hba.conf`
    local  all  postgres  trust
    host   all  postgres  127.0.0.1/32  trust
    host   all  postgres  ::1/128       trust
    ```

- Option 2

    ```bash
    # 1. don't set `HOST` neither `PASSWORD` on DATABASES['default'] settings
    # 2. change these lines on pg_hba.conf
    local  all  postgres  trust
    ```

## Setup pgAdmin

To test it

- Pull image from docker hub

    ```bash
    $ docker pull dpage/pgadmin4:4.20
    ```

- Create docker network

    ```bash
    $ docker network create --driver=bridge pgnetwork
    ```

- Create postgres container with `hostname`, link it to previous network and expose right port

    ```bash
    $ docker run \
        --name mypg \
        --hostname mypg \
        --expose 5432 \
        --network pgnetwork \
        --env POSTGRES_PASSWORD=mypass \
        --env POSTGRES_USER=myuser \
        --env POSTGRES_DB=mydb \
        --user postgres \
        --rm \
        --detach \
            postgres:12.2
    ```

- Create pgAdmin container and link it to previous network

    ```bash
    $ docker run \
        --name mypgadmin \
        --hostname mypgadmin \
        --network pgnetwork \
        --publish 80:80 \
        --env 'PGADMIN_DEFAULT_EMAIL=admin@mypg.com' \
        --env 'PGADMIN_DEFAULT_PASSWORD=mypgadminpass' \
        --detach \
            dpage/pgadmin4:4.20
    ```

- Set params in `Connection` tab

    ```
    Name                    -> {{ the name you want }}
    Host name / address     -> mypg
    Port                    -> 5432
    Maintenance database    -> mydb
    Username                -> myuser
    Password                -> mypass
    ```

- [pgAdmin 4.20 doc](https://www.pgadmin.org/docs/pgadmin4/4.20/container_deployment.html)

## Resources

- Basic Stuffs (installation, basic usage, etc..):
    - [How To Install and Use PostgreSQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
    - [psql — PostgreSQL interactive terminal](https://www.postgresql.org/docs/11/app-psql.html)
    - [The Statistics Collector](https://www.postgresql.org/docs/12/monitoring-stats.html)

- [《Wiki》](https://wiki.postgresql.org/wiki/Main_Page):
    - [Apt](https://wiki.postgresql.org/wiki/Apt)
    - [Don't do this](https://wiki.postgresql.org/wiki/Don%27t_Do_This)
    - [Database Administration and Maintenance](https://wiki.postgresql.org/wiki/Database_Administration_and_Maintenance)
        - [Index Maintenance](https://wiki.postgresql.org/wiki/Index_Maintenance)
        - [Corruption](https://wiki.postgresql.org/wiki/Corruption)
        - [Performance Analysis Tools](https://wiki.postgresql.org/wiki/Performance_Analysis_Tools)
        - [Tuning Your PostgreSQL Server](https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server)
    - [Performance Optimization](https://wiki.postgresql.org/wiki/Performance_Optimization)
        - [Slow Query Questions](https://wiki.postgresql.org/wiki/Slow_Query_Questions)
    - [Feature Matrix](https://www.postgresql.org/about/featurematrix/)

- Extra Tools:
    - [《explain.depesz.com》](https://explain.depesz.com/) - PostgreSQL's explain analyze made readable
    - [《pghero》](https://github.com/ankane/pghero) - A performance dashboard for Postgres
    - [《pome》](https://github.com/rach/pome) - A Postgres Metrics Dashboard
    - [《pev》](https://github.com/AlexTatiyants/pev) - Postgres Explain Visualizer
    - [《pev2》](https://github.com/dalibo/pev2)
    - [《gocmdpev》](https://github.com/simon-engledew/gocmdpev) - A command-line GO Postgres query visualizer
    - [《pg_flame》](https://github.com/mgartner/pg_flame) - A flamegraph generator for Postgres EXPLAIN ANALYZE output
    - [《postgresqltuner》](https://github.com/jfcoz/postgresqltuner) - analyse your PostgreSQL database configuration, and give tuning advice
    - [《pgcenter》](https://github.com/lesovsky/pgcenter) - Command-line admin tool for observing and troubleshooting Postgres
    - [《pgmetrics》](https://github.com/rapidloop/pgmetrics) - Collect and display information and stats from a running PostgreSQL server
    - [《dexter》](https://github.com/ankane/dexter) - The automatic indexer for Postgres
    - [《stolon》](https://github.com/sorintlab/stolon) - PostgreSQL cloud native High Availability and more.

- Database visualizer:
    - [《dbeaver》](https://github.com/dbeaver/dbeaver)
    - [《TablePlus》](https://tableplus.com/)
        - [Linux](https://tableplus.com/linux)
    - [《pgweb》](https://github.com/sosedoff/pgweb) - Cross-platform client for PostgreSQL databases

- PostgreSQL events - Sessions:
    - [PGOpen2019 Sessions](https://postgresql.us/events/pgopen2019/sessions/)
    - [PGOpen2018 Sessions](https://postgresql.us/events/pgopen2018/sessions/)
    - [Sessions from PostgreSQL US events besides PGOpen](https://www.google.com/search?q=site:https://postgresql.us/events/+inurl:session)

- Consistency
    - 2020-06 - [Consistency Models](https://jepsen.io/consistency) - [hn](https://news.ycombinator.com/item?id=23555224)
    - 2020-05 - [Jepsen Disputes MongoDB’s Data Consistency Claims](https://www.infoq.com/news/2020/05/Jepsen-MongoDB-4-2-6/) - [hn](https://news.ycombinator.com/item?id=23285249)
    - [What are the differences between NoSQL and a traditional RDBMS?](https://dba.stackexchange.com/questions/5/what-are-the-differences-between-nosql-and-a-traditional-rdbms)
    - [What is the reasoning behind the CAP theorem?](https://dba.stackexchange.com/questions/4513/what-is-the-reasoning-behind-the-cap-theorem)
    - [Consistency in ACID and CAP theorem, are they the same?](https://dba.stackexchange.com/questions/31260/consistency-in-acid-and-cap-theorem-are-they-the-same)
    - [CAP theorem - Availability and Partition Tolerance](https://stackoverflow.com/questions/12346326/cap-theorem-availability-and-partition-tolerance/)
    - [Transactions across REST microservices?](https://stackoverflow.com/questions/30213456/transactions-across-rest-microservices/)
    - [Eventual consistency in plain English](https://stackoverflow.com/questions/10078540/eventual-consistency-in-plain-english/)
    - [“Eventual Consistency” vs “Strong Eventual Consistency” vs “Strong Consistency”?](https://stackoverflow.com/questions/29381442/eventual-consistency-vs-strong-eventual-consistency-vs-strong-consistency)

- Interesting talks:
    - [Explaining EXPLAIN: A Deep-Dive Into EXPLAIN Plans](https://speakerdeck.com/richyen/explaining-explain-a-deep-dive-into-explain-plans)
    - [Advanced Data Types](https://andreas.scherbaum.la/writings/Advanced_Datatypes_PgDaySF_2020.pdf)
    - [Timeseries data in Postgres with updates](https://www.slideshare.net/GGordonWorleyIII/pgday-sf-2020-timeseries-data-in-postgres-with-updates)

- Interesting blogs from people / groups / companies:
    - [blog](https://github.com/digoal/blog) - Everything about database,business.(Most for PostgreSQL).
- YouTube:
    - Videos:
        - 2020-10-20 - [Percona live ONLINE Open Source Database Conference - Database Talks and Tutorials](https://www.youtube.com/watch?v=tKxMEqd0V5s)
            - Panel: Running Databases in Containers - [10:30:00](https://youtu.be/tKxMEqd0V5s?t=37800) - [11:35:00](https://youtu.be/tKxMEqd0V5s?t=41700)
        - 2020-10-11 - [Hussein Nasser - PostgreSQL 13 Has Some Performance Boosts! Let us discuss it!](https://www.youtube.com/watch?v=wMbTHFXImzI)
        - 2020-09-30 - [Hussein Nasser - Database Indexing Explained (with PostgreSQL)](https://www.youtube.com/watch?v=-qNSXK7s7_w)
        - 2020-09-24 - [2ndQuadrant PostgreSQL - Webinar: New Features in PostgreSQL 13 by Peter Eisentraut](https://www.youtube.com/watch?v=wIRbpkQbioY)
        - 2018-10-22 - [Learn Database Administration - PostgreSQL Database Administration (DBA) for Beginners](https://www.youtube.com/watch?v=aUfPf-clLLs)
        - 2018-08-24 - [PostgreSQL Indexing : How, why, and when.](https://www.youtube.com/watch?v=clrtT_4WBAw)

- Stack Overflow interesting questions:
    - [connect to a DB using psycopg2 without password](https://stackoverflow.com/a/48910290/3889948)

- Release notes / news:
    - [News Archive](https://www.postgresql.org/about/newsarchive/)
        - [pgAdmin 4 v4.28 Released](https://www.postgresql.org/about/news/pgadmin-4-v428-released-2114/)
        - [PostgreSQL 13.1, 12.5, 11.10, 10.15, 9.6.20, and 9.5.24 Released!](https://www.postgresql.org/about/news/postgresql-131-125-1110-1015-9620-and-9524-released-2111/)

- Final Articles / Posts:
    - [PostgreSQL @ Docker Hub](https://hub.docker.com/_/postgres)
    - [PostgreSQL beginner guide - connecting, remote access, psql CLI and troubleshooting connection](https://knowledgepill.it/posts/postgresql-basics-guide/) - [hacker news](https://news.ycombinator.com/item?id=24036132)
    - [Qix - PostgreSQL](https://github.com/ty4z2008/Qix/blob/master/pg.md)
    - [Qix - Database System](https://github.com/ty4z2008/Qix/blob/master/db.md)
    - [《awesome-postgres》](https://github.com/dhamaniasad/awesome-postgres) - A curated list of awesome PostgreSQL software, libraries, tools and resources
    - [PostgreSQL vs. Oracle: Difference in Costs, Ease of Use & Functionality](https://www.reddit.com/r/PostgreSQL/comments/hqnafk/postgresql_vs_oracle_difference_in_costs_ease_of/)
        - [10 things Oracle over PostgreSQL](https://www.reddit.com/r/PostgreSQL/comments/hqnafk/postgresql_vs_oracle_difference_in_costs_ease_of/fy0x0ic/)
    - [Postgres Weekly - Archives](https://postgresweekly.com/issues)
