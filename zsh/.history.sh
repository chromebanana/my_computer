############
# history
############
historyDel() {
  for h in {$1..$2}; do
    history -d $1
  done
  history -d $(history 1 | awk '{print $1}')
}


historyDeln() {
  n=$(history 1 | awk '{print $1}')    # current history number
  historyDel $(( $n-$1 )) $(( $n-1 ))  # Call historyDel with ranges
}
