#! /bin/bash

set -eu

VERSION="v0.11.0"
DownloadLink="https://github.com/k14s/ytt/releases/download/${VERSION}/ytt-linux-amd64"
yttFile="$HELM_PLUGIN_DIR/ytt"

if [[ ! -f "$yttFile" ]]; then
		OsType=$(uname)
		case "$OsType" in
				"Darwin")
						DownloadLink="https://github.com/k14s/ytt/releases/download/${VERSION}/ytt-darwin-amd64"
				 ;;
		esac


		echo "downloading ${DownloadLink} ..."
		wget -O- "$DownloadLink" >  $yttFile
		chmod +x $yttFile
fi

$yttFile "$@"
