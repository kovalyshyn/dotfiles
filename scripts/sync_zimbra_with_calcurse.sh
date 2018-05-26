#!/bin/bash

# backup calendars
cp ~/.calcurse/apts{,.bak}

# import callendars from zimbra
curl -s -u "$ZIMBRA_USER:$ZIMBRA_PASS" -H "Content-Type: text/calendar" "https://$ZIMBRA_HOST/home/$ZIMBRA_USER/Calendar.ics" > ~/.cal-1.tmp

calcurse -i ~/.cal-1.tmp

# deduplicate
awk '!seen[$0]++' ~/.calcurse/apts > ~/.cal-apts.tmp
cat ~/.cal-apts.tmp > ~/.calcurse/apts

# remove tmp files
rm ~/.cal*.tmp
