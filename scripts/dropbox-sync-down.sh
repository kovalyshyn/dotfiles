#!/bin/bash

rclone copy dropbox:Documents ~/Documents -v
rclone copy dropbox:Apps/calcurse ~/.calcurse -v
