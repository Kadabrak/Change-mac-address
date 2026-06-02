#!/bin/bash
get_index(){
  local t=$1
  for i in "${!a[@]}";
      do
        if [ ${a[i]} == $t ]; then
          index=$i
        fi
      done
}
a=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F")
for i in {0..11};
    do
      if [ $(($i%2)) -eq 0 ] && [ $i -ne 0 ]; then
        boo=$boo":"
      fi
      t=$(($RANDOM%15+1));
      if [ $i -eq 1 ] && [ $(($t%2)) -eq 1 ]; then
          while true; do
              t=$(($RANDOM%15+1));
              if [ $(($t%2)) -eq 0 ]; then
                 break
              fi
          done
      fi
      boo=$boo${a[t]};
      get_index "${a[t]}"
    done

echo $boo;
ip link set dev $1 down
ip link set dev $1 address $boo
ip link set dev $1 up
