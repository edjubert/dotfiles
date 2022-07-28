#!/bin/bash

df -H / | sed '1d' | cut -d " " -f7

