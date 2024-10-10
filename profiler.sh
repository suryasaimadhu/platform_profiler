#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <bmcip> <bmcuser> <osip> <osuser>"
    exit 1
fi

# Set the parameters from input arguments
BMCI_IP="$1"
BMC_USER="$2"
OS_IP="$3"
OS_USER="$4"

# Set the output directory
OUTPUT_DIR="/tmp/"  # Modify this path as needed

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Run the platform-profiler command and save the output
./platform-profiler --bmcip "${BMCI_IP}" --bmcuser "${BMC_USER}" --osip "${OS_IP}" --osuser "${OS_USER}" > "${OUTPUT_DIR}/profiler_output.txt" 2>&1

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Platform Profiler executed successfully. Output saved to ${OUTPUT_DIR}/profiler_output.txt"
else
    echo "Platform Profiler failed. Check ${OUTPUT_DIR}/profiler_output.txt for details."
fi

