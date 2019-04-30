## Linux

### General

`$ sudo apt install tree vim build-essential fastboot adb snapd flatpak gnome-software-plugin-flatpak curl gawk p7zip-full gzip gnupg wget aria2 stubby tor torbrowser-launcher transmission-gtk steam golang`

`$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

`$ flatpak install flathub org.telegram.desktop im.riot.Riot com.bitwarden.desktop org.gimp.GIMP org.kde.kdenlive`

### Stubby

[/etc/stubby/stubby.yml](/etc/stubby/stubby.yml)

Set DNS to 127.0.0.1 and ::1

### Bitcoin Core

[https://bitcoincore.org/en/download/](Download)

[~/.bitcoin/bitcoin.conf](~/.bitcoin/bitcoin.conf)

### Keybase

[https://keybase.io/docs/the_app/install_linux](Install)

Import the public key

`$ keybase pgp export | gpg --import`

Import the private key

`$ keybase pgp export -s | gpg --allow-secret-key-import --import`

### Hosty

`$ curl -L git.io/hosty | sh`

### Brave

[https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux](Install)

Extensions

https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb

https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh

https://chrome.google.com/webstore/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj

https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep

https://chrome.google.com/webstore/detail/history-autodelete/bhfakmaiadhflpjloimlagikhodjiefj

https://chrome.google.com/webstore/detail/privacy-settings/ijadljdlbkfhdoblhaedfgepliodmomj

### VSCodium

[https://github.com/VSCodium/vscodium/releases](Install)

### Standard Notes

[https://standardnotes.org/extensions?downloaded=linux](Download)
