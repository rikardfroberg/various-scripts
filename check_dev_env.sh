#!/bin/bash

ERROR_LOG="$0_$(date +%Y-%m-%d).log"
TOOLS="mvn docker-compose docker nodejs ng npm java javac javadoc"

rm -f "$ERROR_LOG"

# usage: error "error msg for log" "error msg for output"
error(){
    msg="$1"
    check="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S: ') $msg" >> "$ERROR_LOG"
    echo "$check (see $ERROR_LOG)" 1>&2
}

check(){
    cmd="$1"
    success="$2"
    err="$3"
    errmsg="$4"
    ($cmd >/dev/null && echo "$success") || error "$err" "$errmsg"
}

echo "Checking installed tools"
for tool in $TOOLS
do
    check "which $tool" " $tool is installed" " $tool is not installed" " Err: $tool is not installed" 
done
echo "Done!"
echo
echo "Listing versions of installed tools"
for tool in $TOOLS
do
    which "$tool" &>/dev/null && (echo -n " $tool: ";$tool --version | head -1)
done
# special handling for ng version output:
which ng &>/dev/null && (echo -n " ng: ";ng --version | grep '^Angular CLI')
echo "Done!"
echo
echo "Checking ssh against bitbucket"

check "ssh -T git@bitbucket.org >/dev/null" " ssh to bitbucket, success" " Couldn't connect via ssh to bitbucket. Did you add your public key to your account?" " Err: ssh to bitbucket"
echo "Done!"
echo
echo "Rough check of versions"

declare -A app_min_versions=(
    [java]=11
    [javac]=11
    [javadoc]=11
    [ng]=9
)
for app in "${!app_min_versions[@]}"
do
    which "$app" &>/dev/null || continue;
    if [[ "$app" == 'ng' ]]
    then
        version=$(ng --version | grep '^Angular CLI' | awk '{print $3;}' | cut -d '.' -f1)
        #version="8"
    else
        version="$($app --version|head -1 | awk '{ print $2;}' | cut -d '.' -f1)"
    fi
    min=${app_min_versions[$app]}
    echo " OK: $app has version $version and recommended min. version is $min"
    if (( version < min ))
    then
        error "$app has version $version, required: $min" " WARN: $app has version $version but $min is recommended."
    fi
done
echo "Done."
