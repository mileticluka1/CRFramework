#Vulnerability Scanner (Unfinished Project)

`CRFramework` represents Code Review (automated white box pentest) framework. This is an unfinished vulnerability scanner script designed to check for potential security vulnerabilities in a given directory containing code files. It includes checks for various common vulnerabilities such as Local File Inclusion (LFI), Remote File Inclusion (RFI), SQL Injection (SQLi), Cross-Site Scripting (XSS), and more. <br>

## Features
    <b>Local File Inclusion (LFI) Vulnerability Check:</b> Looks for potential LFI vulnerabilities within the provided directory.<br>
    <b>Remote File Inclusion (RFI) Vulnerability Check:</b> Searches for potential RFI vulnerabilities within the provided directory.<br>
    <b>SQL Injection (SQLi) Vulnerability Check:</b> Scans for potential SQL injection vulnerabilities within the provided directory.<br>
    <b>Cross-Site Scripting (XSS) Vulnerability Check:</b> Checks for potential XSS vulnerabilities within the provided directory.<br>
    <b>API Key Detection:</b> Attempts to identify API keys within the code files.<br>
    <b>Error Handling Check:</b> Verifies the presence of error handling mechanisms in the code.<br>
    <b>CSRF Token Detection:</b> Looks for CSRF tokens within the code files.<br>
    <b>Cookie and Session Analysis:</b> Checks for the usage of cookies and sessions within the code.<br>
    <b>Identification of Other Common Vulnerabilities:</b> Scans for other common vulnerabilities such as sensitive files, hidden files, specific directories, and more.<br>

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
