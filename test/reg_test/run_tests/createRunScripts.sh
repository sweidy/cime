#!/bin/bash

# CMake sets this variable
HOMME_DIR=@Homme_Build_DIR@

# The "type" of submission (lsf, pbs, standard mpi etc.) for creating the executable scripts 
HOMME_Submission_Type=@Homme_Submission_Type@

# The directory that stores all of the tests
HOMME_TESTING_DIR=${HOMME_DIR}/tests

# Whether to run the OpenMP tests
RUN_OPENMP=false

# Account ID - modified from CMake variable
HOMME_ACCOUNT=@HOMME_PROJID@

# A list (generated by CMake) of all of the tests
source ${HOMME_TESTING_DIR}/test_list.sh

# Functions used to generate the run scripts 
source ${HOMME_TESTING_DIR}/testing-utils.sh

if [ "$1" == all ] ; then

  # The location of all of the lsf scripts generated here
  lsfListFile=${HOMME_TESTING_DIR}/submission-list.sh

  createAllRunScripts

else

  THIS_TEST_FILE=$1

  createRunScript

fi

exit 0
