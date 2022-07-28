#!/bin/bash

acpi | cut -d " " -f5 | cut -d ":" -f1,2
