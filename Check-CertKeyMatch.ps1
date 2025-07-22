param(
    [string]$CertPath,
    [string]$KeyPath
)

if (-not (Test-Path $CertPath)) {
    Write-Host "CERT file not found：$CertPath"
    exit 1
}

if (-not (Test-Path $KeyPath)) {
    Write-Host "KEY file not found：$KeyPath"
    exit 1
}

# 檢查 OpenSSL 是否可用
$openssl = Get-Command "openssl" -ErrorAction SilentlyContinue
if (-not $openssl) {
    Write-Host "OpenSSL not found, please install and add to PATH"
    exit 1
}

# 從 .crt 取得 public key 並計算 hash
$certPubKey = & openssl x509 -in $CertPath -noout -pubkey |
              openssl pkey -pubin -outform pem |
              openssl dgst -sha256 | ForEach-Object { $_ -replace "^\(stdin\)= ", "" }

# 從 .key 取得 public key 並計算 hash
$keyPubKey = & openssl rsa -in $KeyPath -pubout |
             openssl pkey -pubin -outform pem |
             openssl dgst -sha256 | ForEach-Object { $_ -replace "^\(stdin\)= ", "" }

Write-Host "`n CERT Public Key Hash:  $certPubKey"
Write-Host "KEY Public Key Hash: $keyPubKey`n"

if ($certPubKey -eq $keyPubKey) {
    Write-Host "===========Result==========="
    Write-Host "===    CERT MATCH KEY    ==="
    Write-Host "============================"
} else {
    Write-Host "===========Result==========="
    Write-Host "===  CERT NOT MATCH KEY  ==="
    Write-Host "============================"
}
