#!/bin/csh
#################################################################
# Csh Script to retrieve 124 online Data files of 'ds083.2',
# total 2.28G. This script uses 'wget' to download data.
#
# Highlight this script by Select All, Copy and Paste it into a file;
# make the file executable and run it on command line.
#
# You need pass in your password as a parameter to execute
# this script; or you can set an environment variable RDAPSWD
# if your Operating System supports it.
#
# Contact grace@ucar.edu (Grace Peng) for further assistance.
#################################################################

set pswd = bgJLE3th
if(x$pswd == x && `env | grep RDAPSWD` != '') then
 set pswd = $RDAPSWD
endif
if(x$pswd == x) then
 echo
 echo Usage: $0 YourPassword
 echo
 exit 1
endif
set v = `wget -V |grep 'GNU Wget ' | cut -d ' ' -f 3`
set a = `echo $v | cut -d '.' -f 1`
set b = `echo $v | cut -d '.' -f 2`
if(100 * $a + $b > 109) then
 set opt = 'wget --no-check-certificate'
else
 set opt = 'wget'
endif
set opt1 = '-O Authentication.log --save-cookies auth.rda_ucar_edu --post-data'
set opt2 = "email=r.bassett@lancaster.ac.uk&passwd=$pswd&action=login"
$opt $opt1="$opt2" https://rda.ucar.edu/cgi-bin/login
set opt1 = "-N --load-cookies auth.rda_ucar_edu"
set opt2 = "$opt $opt1 http://rda.ucar.edu/data/ds083.2/"
set filelist = ( \
  grib2/2016/2016.01/fnl_20160101_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160101_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160101_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160101_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160102_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160102_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160102_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160102_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160103_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160103_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160103_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160103_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160104_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160104_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160104_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160104_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160105_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160105_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160105_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160105_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160106_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160106_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160106_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160106_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160107_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160107_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160107_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160107_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160108_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160108_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160108_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160108_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160109_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160109_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160109_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160109_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160110_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160110_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160110_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160110_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160111_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160111_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160111_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160111_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160112_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160112_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160112_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160112_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160113_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160113_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160113_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160113_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160114_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160114_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160114_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160114_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160115_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160115_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160115_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160115_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160116_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160116_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160116_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160116_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160117_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160117_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160117_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160117_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160118_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160118_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160118_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160118_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160119_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160119_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160119_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160119_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160120_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160120_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160120_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160120_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160121_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160121_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160121_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160121_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160122_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160122_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160122_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160122_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160123_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160123_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160123_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160123_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160124_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160124_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160124_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160124_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160125_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160125_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160125_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160125_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160126_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160126_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160126_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160126_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160127_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160127_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160127_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160127_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160128_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160128_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160128_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160128_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160129_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160129_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160129_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160129_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160130_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160130_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160130_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160130_18_00.grib2 \
  grib2/2016/2016.01/fnl_20160131_00_00.grib2 \
  grib2/2016/2016.01/fnl_20160131_06_00.grib2 \
  grib2/2016/2016.01/fnl_20160131_12_00.grib2 \
  grib2/2016/2016.01/fnl_20160131_18_00.grib2 \
)
while($#filelist > 0)
 set syscmd = "$opt2$filelist[1]"
 echo "$syscmd ..."
 $syscmd
 shift filelist
end

rm -f auth.rda_ucar_edu Authentication.log
exit 0