#Vulnerability Scanner (Unfinished Project)

`CRFramework` represents Code Review (automated white box pentest) framework. This is an unfinished vulnerability scanner script designed to check for potential security vulnerabilities in a given directory containing code files. It includes checks for various common vulnerabilities such as Local File Inclusion (LFI), Remote File Inclusion (RFI), SQL Injection (SQLi), Cross-Site Scripting (XSS), and more. <br>

## Features
    Local File Inclusion (LFI) Vulnerability Check: Looks for potential LFI vulnerabilities within the provided directory.
    Remote File Inclusion (RFI) Vulnerability Check: Searches for potential RFI vulnerabilities within the provided directory.
    SQL Injection (SQLi) Vulnerability Check: Scans for potential SQL injection vulnerabilities within the provided directory.
    Cross-Site Scripting (XSS) Vulnerability Check: Checks for potential XSS vulnerabilities within the provided directory.
    API Key Detection: Attempts to identify API keys within the code files.
    Error Handling Check: Verifies the presence of error handling mechanisms in the code.
    CSRF Token Detection: Looks for CSRF tokens within the code files.
    Cookie and Session Analysis: Checks for the usage of cookies and sessions within the code.
    Identification of Other Common Vulnerabilities: Scans for other common vulnerabilities such as sensitive files, hidden files, specific directories, and more.

## Usage

Ensure you have `bash` installed on your system.<br>
 <br>
To run the script, execute the following command in your terminal:
```
bash main.sh <path to directory>
```
Replace <directory_path> with the path to the directory you want to scan for vulnerabilities.<br>

## Disclaimer

This project is currently unfinished and may not provide comprehensive vulnerability detection. It is recommended to use additional security measures and conduct thorough testing to ensure the security of your applications.

## Note

This README serves as documentation for the script's current functionalities and intended usage. Further development may enhance its capabilities and reliability.
