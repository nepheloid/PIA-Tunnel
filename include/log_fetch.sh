# fetch the latest git log for the webui

rm -f /pia/cache/webui-update_status_out.txt
val=`cd /pia ; git fetch origin &> /dev/null ; git rev-list HEAD... origin/"$1" --count 2>/dev/null`

if [ "$val" = "0" ] || [ "$val" = "1" ]; then
  dt=`date +%s`
  echo "$dt|$val" > /pia/cache/webui-update_status.txt

  #fetch latest changelog
  cd /tmp
  mkdir piatmpget ; cd /tmp/piatmpget
  wget http://www.kaisersoft.net/pia_latest_changes.md
  mv pia_latest_changes.md /var/www/pia_latest_changes.md
  cd /tmp ; rm -rf /tmp/piatmpget

else
  echo -e "[\e[1;31mfail\e[0m] "$(date +"%Y-%m-%d %H:%M:%S")\
    "- invalid information returned by git .... "\
    "$val"
fi
