#!/bin/bash

# fail2ban-client status to get all jails, takes about ~70ms
jails=($(fail2ban-client status | grep "Jail list:" | sed "s/ //g" | awk '{split($2,a,",");for(i in a) print>

out="jail,failed,total,banned,total\n"

for jail in ${jails[@]}; do
    # slow because fail2ban-client has to be called for every jail (~70ms per jail)
    status=$(fail2ban-client status ${jail})
    failed=$(echo "$status" | grep -ioP '(?<=Currently failed:\t)[[:digit:]]+')
    totalfailed=$(echo "$status" | grep -ioP '(?<=Total failed:\t)[[:digit:]]+')
    banned=$(echo "$status" | grep -ioP '(?<=Currently banned:\t)[[:digit:]]+')
    totalbanned=$(echo "$status" | grep -ioP '(?<=Total banned:\t)[[:digit:]]+')
    out+="$jail,$failed,$totalfailed,$banned,$totalbanned\n"
done

printf "\nfail2ban status:\n"
printf $out | column -ts $',' | sed -e 's/^/  /'

