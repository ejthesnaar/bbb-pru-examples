#! /bin/bash

##############################################################################
#
# Copyright (C) 2018 Emile Thesnaar <emilethes@gmail.com>
#
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#	* Redistributions of source code must retain the above copyright
#	  notice, this list of conditions and the following disclaimer.
#
#	* Redistributions in binary form must reproduce the above copyright
#	  notice, this list of conditions and the following disclaimer in the
#	  documentation and/or other materials provided with the
#	  distribution
#
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#############################################################################

# Clean outputs, then build.
make clean
make

# Stop PRU0
sudo sh -c 'echo stop > /sys/class/remoteproc/remoteproc1/state'

# Load firmware
sudo cp gen/*.out /lib/firmware/am335x-pru0-fw

# Configure pin
config-pin -a P9_25 pruout
config-pin -q P9_25

# Start PRU 0 (remoteproc1 = PRU 0)
sudo sh -c 'echo am335x-pru0-fw > /sys/class/remoteproc/remoteproc1/firmware'
sudo sh -c 'echo start > /sys/class/remoteproc/remoteproc1/state'

echo "Done.  PRU should now toggle pin 25 on header 9."
