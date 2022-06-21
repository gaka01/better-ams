data=$(curl -s http://93.155.192.228/Weather_Summary_Vantage_Pro_Plus.htm | iconv -f WINDOWS-1251 -t UTF-8)

labels=$(echo "$data" | grep  '<TD.*Tw Cen MT' | grep -v 'colspan' | sed 's/<\/font><\/strong><FONT face="Tw Cen MT"><STRONG>//g  ;  s/.*MT">//g ; s/<STRONG>//g   ;  s/<span lang="bg">//g  ;  s/<.*//g' | tr '\n' ';');
values=$(echo "$data" | grep '<TD.*align=left' | sed 's/.*<b>//g  ;  s/&nbsp\;//g  ;  s/<.*//g  ;  s/  / /g  ; s/^ *//g' | tr '\n' ';');

echo -e "$labels\n$values"
