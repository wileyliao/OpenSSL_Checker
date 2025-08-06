# OpenSSL
## 1. Check if CERT and KEY matched
### Step 1-1. 
[Download OpenSSL (Light Version)](https://slproweb.com/products/Win32OpenSSL.html)

### Step 1-2. 
Edit the system environment variables(add bin folder to "Path")

### Step 1-3. 
Run the script to check if its installed sucessfully
```powershell
openssl version
```
### Step 1-4. 
Download "Check-CertKeyMatch.ps1"

### Step 1-5. 
Run the script with your cert and key path:

```powershell
.\Check-CertKeyMatch.ps1 -CertPath ".\server.crt" -KeyPath ".\server.key"
```

## 2. Self-signed CERT
###  2-1. Generate localhost ssl for dev usage (by using .cnf file)
```powershell
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout cert.key -out full_chain.crt -config openssl-ai.cnf -extensions v3_req
```
### 2-2. Check CERT was signed by which organization
```powershell
openssl x509 -in full_chain.crt -noout -subject
```
