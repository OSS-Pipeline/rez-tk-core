#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
TK_CORE_URL=$1
TK_CORE_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] TK-CORE URL: ${TK_CORE_URL}"
echo -e "[INSTALL][ARGS] TK-CORE VERSION: ${TK_CORE_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${INSTALL_PATH} || -z ${TK_CORE_URL} || -z ${TK_CORE_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We install tk-core.
echo -e "\n"
echo -e "[INSTALL] Installing tk-core-${TK_CORE_VERSION}..."
echo -e "\n"

# We copy the necessary files to the install directory.
pip2 \
    install ${TK_CORE_URL} \
    --target ${INSTALL_PATH} \
    --upgrade \
    --no-dependencies

echo -e "\n"
echo -e "[INSTALL] Finished installing tk-core-${TK_CORE_VERSION}!"
echo -e "\n"
