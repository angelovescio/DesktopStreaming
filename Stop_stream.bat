@echo off
title Stop Stream
cd /d "<directory containing nginx>"
start nginx -s stop
exit