#!/usr/bin/env bash
set -eu

tablename=isunwilling
expapp=_expectation
expname=$tablename$expapp
threshold=90
negthreshold=1

deepdive sql "UPDATE $tablename SET inference_result = 'Yes' WHERE inference_result != 'No' and doc_id in (select doc_id from $expname where expectation >= $threshold);"


tablename=isunderage
expapp=_expectation
expname=$tablename$expapp
threshold=90

deepdive sql "UPDATE $tablename SET inference_result = 'Yes' WHERE inference_result != 'No' and doc_id in (select doc_id from $expname where expectation >= $threshold);"


tablename=ispicturereal
expapp=_expectation
expname=$tablename$expapp
threshold=90

deepdive sql "UPDATE $tablename SET inference_result = 'No' WHERE inference_result != 'Yes' and doc_id in (select doc_id from $expname where expectation <= $negthreshold);"

tablename=isdrug
expapp=_expectation
expname=$tablename$expapp
threshold=90

deepdive sql "UPDATE $tablename SET inference_result = 'Yes' WHERE inference_result != 'No' and doc_id in (select doc_id from $expname where expectation >= $threshold);"


tablename=isagency
expapp=_expectation
expname=$tablename$expapp
threshold=99

deepdive sql "UPDATE $tablename SET inference_result = 'Yes' WHERE inference_result != 'No' and doc_id in (select doc_id from $expname where expectation >= $threshold);"

tablename=isabuse
expapp=_expectation
expname=$tablename$expapp
threshold=90

deepdive sql "UPDATE $tablename SET inference_result = 'Yes' WHERE inference_result != 'No' and doc_id in (select doc_id from $expname where expectation >= $threshold);"

