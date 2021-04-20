#!/usr/bin/env bash
# COPY: listing params (& rename paths in conf)
# EDIT schema below

# run_churn_listing.py

SCHEMA=socialnet7
PYTHONUNBUFFERED=1
CHURN_DB=fight_churn
CHURN_DB_USER=limcheekin
CHURN_DB_PASS=1qaz2wsx

CHURN_ROOT=ws

PYTHONPATH="${PYTHONPATH}:$HOME/$CHURN_ROOT/fight-churn/listings/chap3:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap5:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap6:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap7:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap8:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap9:"\
"$HOME/$CHURN_ROOT/fight-churn/listings/chap10"

export PYTHONPATH
export PYTHONUNBUFFERED
export CHURN_DB
export CHURN_DB_USER
export CHURN_DB_PASS

cd $HOME/$CHURN_ROOT/fight-churn/listings/py/

cd $HOME/$CHURN_ROOT/fight-churn/data-generation/py
python churndb.py $SCHEMA
python churnsim.py $SCHEMA
cd $HOME/$CHURN_ROOT/fight-churn/listings/py/


# churn rate
python run_churn_listing.py --schema $SCHEMA --chap 2 --listing 1 2 3 4 5

# simple counts
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 1 2

# event QA
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 9 --version 1 2 3 4 5 6 7 8
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 10 --version 1 2 3 4 5 6 7 8

# standard metric names
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 4 --version 1 2 3 4 5 6 7 8 11

# Account tenure metric
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 13

# standard metric
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 3
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 3 --version 2 3 4 5 6 7 8

# metric QA
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 6 --version 1 2 3 4 5 6 7 8
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 7 --version 1 2 3 4 5 6 7 8

# Metric coverage test
python run_churn_listing.py --schema $SCHEMA --chap 3 --listing 8 11

# total metric
python run_churn_listing.py --schema $SCHEMA --chap 7 --listing 3 --insert

# Change metrics
python run_churn_listing.py --schema $SCHEMA --chap 7 --listing 4 6 --insert

# Scaled metrics
python run_churn_listing.py --schema $SCHEMA --chap 7 --listing 7 --insert
python run_churn_listing.py --schema $SCHEMA --chap 7 --listing 8 --version 1 2 --insert

## ratios
python run_churn_listing.py --schema $SCHEMA --chap 7 --listing 1 --version 1 2 3 4 5 6 7 --insert

# Calculate active periods and observation dates
python run_churn_listing.py --schema $SCHEMA --chap 4 --listing 1 2 4

# Extract the data
python run_churn_listing.py --schema $SCHEMA --chap 4 --listing 5

# Stats
python run_churn_listing.py --schema $SCHEMA --chap 5 --listing 2

# Scores data set 1
python run_churn_listing.py --schema $SCHEMA --chap 5 --listing 3

# Pair scatter plots
python run_churn_listing.py --schema $SCHEMA --chap 6 -listing 1 --version 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

# Grouping data set 1
python run_churn_listing.py --schema $SCHEMA --chap 6 --listing 2 4 3 5

# Dataset2 Extract & Processing
python run_churn_listing.py --schema $SCHEMA --chap 8 --listing 0 1

# Regression
python run_churn_listing.py --schema $SCHEMA --chap 8 --listing 2

# Prediction
python run_churn_listing.py --schema $SCHEMA --chap 8 --listing 3 4 5 6

# Current Stats
python run_churn_listing.py --schema $SCHEMA --chap 5 --listing 2 --version 7 8 9

# Accuracy code test
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 1 2 3

# Levels of C param
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 4 --version 1 2 3

# Cross validation
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 5
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 5 --version 1
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 6
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 6 --version 1

# Forecast xgb
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 7


# Categorical data extract
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 1

# Categorical plots
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 2 --version 1 2

# Categorical plot with group
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 3


# Dummy variables
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 4

# Re-prepare the non-dummy part of categorical data
python run_churn_listing.py --schema $SCHEMA --chap 8 --listing 2 --version 3

# Merge dummies & groupscores
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 5
python run_churn_listing.py --schema $SCHEMA --chap 6 --listing 2 --version 3


#  Categorical cross valid / regression
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 5 --version 2 3
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 4 --version 4 5
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 6 --version 2

# Current Categorical data
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 6

# Current categorical data prep (call 4 and 5)
python run_churn_listing.py --schema $SCHEMA --chap 10 --listing 7

# Categorical current foecast
python run_churn_listing.py --schema $SCHEMA --chap 8 --listing 5 --version 2
python run_churn_listing.py --schema $SCHEMA --chap 9 --listing 7 --version 2

# Cohorts (after all metrics generated)
python run_churn_listing.py --schema $SCHEMA --chap 5 --listing 1 --version 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
