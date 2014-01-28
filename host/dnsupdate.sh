#!/bin/sh
# This needs to be executed on any servers that need/have a DNS name.
nsupdate -k Kwkunker.gmail.com.+157+38867.private -v my-nsupdate.cfg
