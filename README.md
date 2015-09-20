## How to bring up search inteface
```bash
# use the environment setup
. env.sh

# initialize database and launch a PostgreSQL instance at a random port
initdb -D pgdb
postgres -D pgdb -p 5322 
createdb -p 5322 memex-reviews
export DEEPDIVE_DB_URL=postgresql://localhost:5322/memex-reviews
# you could also modify db.url file

# create tables, load data with input/init.sh
deepdive initdb

# run DeepDive if necessary
#deepdive run

# define which port to use for your own Elasticsearch instance launched internally by mindbender
export ELASTICSEARCH_BASEURL=http://localhost:9${RANDOM:0:3}
# index the database for search

# if existing indices, need to clean them first:
# mindbender search drop
# rm indices under search/

mindbender search update

# launch your own search GUI on a random port
PORT=$RANDOM mindbender search gui
```
