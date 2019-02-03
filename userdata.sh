#!/bin/bash

echo "Hello!!!" > index.html
nohup busybox httpd -f -p 80 &