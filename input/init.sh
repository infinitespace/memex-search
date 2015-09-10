#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

#mindbender hack \
#./jsonColumns2pg reviews pipe/ann. id:text text:text sentenceOffsets:int[][] tokenOffsets:int[][] tokens:text[] nerTags=ners:text[] poss:text[]

sanitize() {
    echo >&2 "Loading $1"
    sed 's/\\$/\\\\/' <"$1" |
    pv --line-mode --size="$(wc -l <"$1")"
}

SCALE=small

deepdive sql "truncate review_content"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/escort_review_content.tsv |
deepdive sql "COPY review_content        FROM STDIN"

deepdive sql "truncate provider_info"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/escort_review_info.tsv |
deepdive sql "COPY provider_info        FROM STDIN"

deepdive sql "truncate provider_review" 
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/escort_review_index.tsv |
deepdive sql "COPY provider_review FROM STDIN"

deepdive sql "truncate review_to_ads"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/matchReviewToAds.tsv |
deepdive sql "COPY review_to_ads FROM STDIN"

deepdive sql "truncate isdrug"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/isdrug.tsv.noquote |
deepdive sql "COPY isdrug FROM STDIN"

deepdive sql "truncate isunderage"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/isunderage.tsv.noquote |
deepdive sql "COPY isunderage FROM STDIN"

deepdive sql "truncate isabuse"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/isabuse.tsv.noquote |
deepdive sql "COPY isabuse FROM STDIN"

deepdive sql "truncate isunwilling"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/isunwilling.tsv.noquote |
deepdive sql "COPY isunwilling FROM STDIN"

deepdive sql "truncate isagency"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/isagency.tsv.noquote |
deepdive sql "COPY isagency FROM STDIN"

deepdive sql "truncate ispicturereal"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/ispicturereal.tsv.noquote |
deepdive sql "COPY ispicturereal FROM STDIN"

deepdive sql "truncate index_all"
sanitize /lfs/local/0/wenbo/memex/escort-review/out/$SCALE/indexall.tsv.noquote |
deepdive sql "COPY index_all FROM STDIN"
