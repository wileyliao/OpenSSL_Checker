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
###  2-1. Generate ssl for dev usage (by using .cnf file, expiry date = 100 years)
```powershell
openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout cert.key -out full_chain.crt -config openssl-ai.cnf -extensions v3_req
```
### 2-2. Check CERT was signed by which organization
```powershell
openssl x509 -in full_chain.crt -noout -subject
```

## 3. Authorize Self-signed CERT on Windows
###  3-1. Double click .crt file that generate from step 2.
>- 安裝憑證
>- 本機電腦
>- 將所有憑證放入以下的存放去
>- 瀏覽：受信任的根憑證授權單位

### 3-2. If using server name(xxxx.xxxxx) instead of IP address:
>- Open notepad as Admin of file: `C:\Windows\System32\drivers\etc\hosts`
>- Add `your.ip.address xxxx.xxxxx` in the last line for DNS mapping of this PC

## 4. Authorize Self-signed CERT on IOS
###  3-1. download .crt file that generate from step 2. but using `.cer` file
>- 設定
>- 描述檔
>- 信任此描述檔

### 3-2. If using server name(xxxx.xxxxx) instead of IP address:
>- Need to set DNS on your router instead(IOS is not available this setting)

