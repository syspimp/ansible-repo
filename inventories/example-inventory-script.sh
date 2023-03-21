#!/bin/bash
#pretend this array comes from somewhere, like a db
managedhosts=( 10.55.102.22 10.55.102.23 10.55.102.24 )
customgroup="special"
customgrouphosts=( 10.55.102.25 )
main()
{
  # loop through the array
  for host in ${managedhosts[@]};
  do
    line+="\"${host}\","
  done
  for host in ${customgrouphosts[@]};
  do
    customline+="\"${host}\","
  done
  echo "{
    \"all\": {
        \"hosts\": [${line%%,}],
        \"vars\": {
            \"var1\": true
        },
        \"children\": [\"${customgroup}\"]
    },
    \"${customgroup}\": {
        \"hosts\": [${customline%%,}],
        \"vars\": {
            \"var2\": 500
        },
        \"children\":[]
    }
}"
}

main
exit 0


