## Linux

### General

`$ sudo apt install tree vim build-essential fastboot adb flatpak gnome-software-plugin-flatpak curl gawk p7zip-full gzip gnupg wget aria2 dnscrypt-proxy tor torbrowser-launcher transmission-gtk steam golang`

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub org.telegram.desktop im.riot.Riot com.bitwarden.desktop org.gimp.GIMP org.kde.kdenlive`

### Vim

[~/.vimrc](https://raw.githubusercontent.com/astrolince/configs/master/~/.vimrc)

### NetworkManager

[/etc/NetworkManager/NetworkManager.conf](https://raw.githubusercontent.com/astrolince/configs/master/etc/NetworkManager/NetworkManager.conf)

[/etc/NetworkManager/conf.d/30-randomize-mac-address.conf](https://raw.githubusercontent.com/astrolince/configs/master/etc/NetworkManager/conf.d/30-randomize-mac-address.conf)

`$ sudo systemctl restart NetworkManager`

### dnscrypt-proxy

[/etc/dnscrypt-proxy/dnscrypt-proxy.toml](https://raw.githubusercontent.com/astrolince/configs/master/etc/dnscrypt-proxy/dnscrypt-proxy.toml)

`$ sudo systemctl restart dnscrypt-proxy`

Set DNS to 127.0.2.1 from GUI and reconnect to the network

### Bitcoin Core

[Download](https://bitcoincore.org/en/download/)

[~/.bitcoin/bitcoin.conf](https://raw.githubusercontent.com/astrolince/configs/master/~/.bitcoin/bitcoin.conf)

### Keybase

[Install](https://keybase.io/docs/the_app/install_linux)

Import the public key

`$ keybase pgp export | gpg --import`

Import the private key

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

### Rust

`$ curl https://sh.rustup.rs -sSf | sh`

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

[Install](https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux)

Extensions

[Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)

[Cookie AutoDelete](https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh)

[Decentraleyes](https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj)

[GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)

[History AutoDelete](https://chrome.google.com/webstore/detail/history-autodelete/bhfakmaiadhflpjloimlagikhodjiefj)

[Privacy Settings](https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj)

### VSCodium

[Install](https://github.com/VSCodium/vscodium/releases)

### Standard Notes

[Download](https://standardnotes.org/extensions?downloaded=linux)
