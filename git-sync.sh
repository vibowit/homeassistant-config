#!/bin/bash
# remote-ha-sync.sh
# This script connects to your Home Assistant OS instance,
# pulls updates from the Git repository in /config, and runs a configuration check.
# It uses SSH with TTY allocation and leverages zsh on the remote side to source the
# Home Assistant profile for proper environment setup.

# Configuration variables
REMOTE_USER="vibowit"
REMOTE_HOST="haos.local"
CONFIG_DIR="/config"
PROFILE_SCRIPT="/etc/profile.d/homeassistant.sh"

# Execute commands on the remote HAOS host via SSH.
ssh -t "${REMOTE_USER}@${REMOTE_HOST}" "cd ${CONFIG_DIR} && sudo zsh -c 'source ${PROFILE_SCRIPT} && git pull && ha core check'"
