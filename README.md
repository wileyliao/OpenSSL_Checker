# OpenSSL_Checker

### Step 1. 
[Download OpenSSL (Light Version)](https://slproweb.com/products/Win32OpenSSL.html)

### Step 2. 
Edit the system environment variables(add bin folder to "Path")

### Step 3. 
Run the script to check if its installed sucessfully
```powershell
openssl version
```
### Step 4. 
Download "Check-CertKeyMatch.ps1"

### Step 5. 
Run the script with your cert and key path:

```powershell
.\Check-CertKeyMatch.ps1 -CertPath ".\server.crt" -KeyPath ".\server.key"
```
