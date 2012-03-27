#!/bin/bash

tr -d '\0-\177' | iconv -f iso-8859-1 -t utf8
