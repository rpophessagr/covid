#!/bin/bash

rm virus.csv
wget  --output-document=data/virus.csv "http://hgis.uw.edu/virus/assets/virus.csv"
