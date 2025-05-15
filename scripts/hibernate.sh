#!/bin/bash

zenity --question --text="Do you really want to hibernate the system?" && systemctl hibernate
