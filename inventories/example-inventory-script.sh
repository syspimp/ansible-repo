#!/bin/bash
#pretend this array comes from somewhere, like a db
managedhosts=( 10.55.102.22 10.55.102.23 10.55.102.24 )
customgroups='"special","notsospecial"'
special_hosts=( 10.55.102.25 10.55.102.26 10.55.102.27)
notsospecial_hosts=( 10.55.102.28 )
main()
{
  # loop through the array
  for host in ${managedhosts[@]};
  do
    line+="\"${host}\","
  done
  OLDIFS=$IFS
  IFS=","
  for group in ${customgroups[@]};
  do
    IFS=${OLDIFS}
    custom_hosts=${group//\"/}_hosts
    for host in ${!custom_hosts}
    do
      customline=${custom_hosts}_line
      eval ${customline}+='"${host}",'
    done
  done
  echo "{
\"all\": {
        \"hosts\": [${line%%,}],
        \"vars\": {
            \"var1\": \"true\"
        },
        \"children\": [${customgroups}]
    },"
  OLDIFS=$IFS
  IFS=","
  for group in ${customgroups[@]}
  do
    IFS=${OLDIFS}
    custom_hosts=${group//\"/}_hosts
    line="${custom_hosts}_line"
    echo "${group}: {
        \"hosts\": [\"${!line%%,}\"],
        \"vars\": {
            \"var2\": \"500\"
        },
        \"children\":[]
    },"
  done
  echo "}"
}

main
exit 0


