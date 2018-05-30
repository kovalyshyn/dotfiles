#!/bin/bash

rclone copy ~/Documents dropbox:Documents -v
rclone copy ~/.calcurse dropbox:Apps/calcurse -v
