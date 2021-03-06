#!/bin/zsh

citrix_info() {
    echo "https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html"
}

citrix_install() {
    declare tmp_file=$tempdir/icaclient_amd64.deb
    declare url=https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html

    curl -sSL $url |
        grep -Eo 'rel="[^\"]+"' |
        awk -F\" '{print $2}' |
        awk '/icaclient_.*_amd64.deb/{print "http:"$0}' |
        wget -O $tmp_file -i -

    aptx install $tmp_file
}
