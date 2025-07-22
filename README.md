# OpenSSL_Checker

### Step 1. 
Install OpenSSL(light version is enough) `https://slproweb.com/products/Win32OpenSSL.html`

### Step 2. 
Edit the system environment variables(add bin folder to "Path")

### Step 3. 
Using command `openssl version` to check if its installed sucessfully

### Step 4. 
Download "Check-CertKeyMatch.ps1"

### Step 5. 
Run the script with your cert and key path:

```powershell
.\Check-CertKeyMatch.ps1 -CertPath ".\server.crt" -KeyPath ".\server.key"

