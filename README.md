## Linux

### Stubby

`$ sudo apt install stubby`

[/etc/stubby/stubby.yml](/etc/stubby/stubby.yml)

Set DNS to 127.0.0.1 and ::1

### Bitcoin Core

https://bitcoincore.org/en/download/

[~/.bitcoin/bitcoin.conf](~/.bitcoin/bitcoin.conf)

### Keybase

https://keybase.io/docs/the_app/install_linux

Import the public key

`$ keyabse pgp export | gpg --import`

Import the private key

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`
