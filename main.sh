#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' 

check_lfi() {
    local directory="$1"
    local lfi_payloads=(
        "include\(" 
        "include_once\(" 
        "require\("
        "require_once\("
    )

    for payload in "${lfi_payloads[@]}"; do
        grep -r -nE "$payload" "$directory"
    done
}

check_rfi() {
    local directory="$1"
    local rfi_payloads=(
        "include\('http" 
        "include_once\('http" 
        "require\('http" 
        "require_once\('http"
    )

    for payload in "${rfi_payloads[@]}"; do
        grep -r -nE "$payload" "$directory"
    done
}

check_apikeys() {
	local directory="$1"
	local api_payloads=(
		"api"
		"key"
	)
}

check_sqli() {
    local directory="$1"
    local sqli_payloads=(
        "mysql_query\(" 
        "mysqli_query\(" 
        "pg_query\(" 
        "sqlite_query\(" 
        "db_query\("
    )

    for payload in "${sqli_payloads[@]}"; do
        grep -r -nE "$payload" "$directory"
    done
}

check_xss() {
    local directory="$1"
    local xss_payloads=(
        "echo \$user_input;" 
        "echo \$_GET['user_input'];" 
        "echo \$_POST['user_input'];" 
        "echo \$_REQUEST['user_input'];"
    )

    for payload in "${xss_payloads[@]}"; do
        grep -r -nE "$payload" "$directory"
    done
}

check_errorhandling() {
	local directory="$1"
	local error_payloads=(
		"error"
		"onerror"
	)
}

check_csrftokens() {
	local directory="$1"
	local csrftokens_payloads=(
		"csrf"
	)
}

check_cookies() {
	local directory="$1"
	local cookies_payloads=(
		"session"
		"sessions"
		"cookie"
		"token"
		"SESSION"
	)
}

check_fileupload() {
	local directory="$1"
	local fileupload_payloads=(
            "upload"
	    "file upload"
	    "upload file"
	    "file transfer"
	    "uploadData"
	    "uploadFile"
	    "sendFile"
	    "saveFile"
	    "uploadImage"
	    "uploadDocument"
	    "uploadMedia"
	    "uploadAttachment"
	    "uploadAudio"
	    "uploadVideo"
	    "uploadPhoto"
	    "uploadDocument"
	    "fileHandler"
	    "fileManager"
	    "fileHandler"
	    "uploadManager"
	    "uploadHandler"
	    "fileProcessor"
	    "fileReceiver"
	    "fileSaver"
	    "fileStorage"
	)
}

check_other_vulnerabilities() {
    local directory="$1"
    echo -e "${MAGENTA}Checking for other common vulnerabilities...${NC}"
    echo -e "Checking for common files and directories..."

    local files_to_check=(
        "php.ini"
        "robots.txt"
        ".htaccess"
        "sitemap.xml"
        "README.md"
        "web.config"
        "security.txt"
        "db.php"
        "db*"
        "database*"
        "*.xml"
        "*.csv"
        "*.txt"
        "api"
    )

    for file in "${files_to_check[@]}"; do
        find "$directory" -type f -name "$file" -print
    done

    echo -e "${GREEN}\nChecking for hidden files... \n===================================================================================================================================================================\n ${NC}"
    find "$directory" -type f -name ".*" -print

    echo -e "${RED}\nChecking for specific directories...  \n===================================================================================================================================================================\n ${NC}"
    local directories_to_check=(
        "uploads"
        "assets"
        "asset"
        "img"
        "images"
        "data"
        "cgi-bin"
    )

    for dir in "${directories_to_check[@]}"; do
        find "$directory" -type d -name "$dir" -print
    done

    echo -e "${CYAN}\nChecking for panels, admin files or pages, or directories... \n===================================================================================================================================================================\n ${NC}"
    find "$directory" -type d \( -name "panel" -o -name "admin" -o -name "admin*" -o -name "administration" -o -name "*admin*" \) -print
    find "$directory" -type f \( -name "admin" -o -name "admin*" -o -name "login" -o -name "*admin*" \) -print
}

main() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <directory>"
        exit 1
    fi

    local directory="$1"

    echo "======================================================="
    echo "Checking for potential vulnerabilities in $directory..."
    echo "======================================================="
    echo -e "Starting in 5 seconds\n.....................\n"
    sleep 5
    
    echo -e "${RED}Checking for Local File Inclusion (LFI) vulnerabilities... \n=================================================================================================================================================================== \n${NC}"
    check_lfi "$directory"

    echo -e "${BLUE}Checking for Remote File Inclusion (RFI) vulnerabilities... \n=================================================================================================================================================================== \n${NC}"
    check_rfi "$directory"

    echo -e "${YELLOW}Checking for SQL Injection (SQLi) vulnerabilities... \n=================================================================================================================================================================== \n${NC}"
    check_sqli "$directory"

    echo -e "${CYAN}Checking for Cross-Site Scripting (XSS) vulnerabilities... \n=================================================================================================================================================================== \n${NC}"
    check_xss "$directory"

    echo -e "${BLUE}Checking for possible API keys in code... \n===================================================================================================================================================================\n${NC}"
    check_apikeys "$directory"

    echo -e "${YELLOW}Checking for Error handling in code... \n===================================================================================================================================================================\n${NC}"
    check_errorhandling "$directory"

    echo -e "${CYAN}Checking for CSRF Tokens... \n===================================================================================================================================================================\n ${NC}"
    check_csrftokens "$directory"

    echo -e "${RED}Checking for File Upload Vulnerabilities... \n===================================================================================================================================================================\n ${NC}"
    check_fileupload "$directory"

    echo -e "${GREEN}Checking for cookies and sessions... \n===================================================================================================================================================================\n${NC}"
    check_cookies "$directory"

    echo -e "${MAGENTA}Checking for other common vulnerabilities... \n=================================================================================================================================================================== \n${NC}"
    check_other_vulnerabilities "$directory"

    echo "Review complete."
}

main "$@"
