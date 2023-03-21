#!/usr/bin/python
import json
managedhosts= [
  "10.55.102.78",
  "10.55.102.51",
  ]
hostvars= {
        "var1": "true",
        "environment": "production"
}
customgroups = [ "webservers","dbservers"]
webservers_vars = {}
webservers = [
        "10.55.102.101",
        ]
dbservers_vars = {
        "var1": "not true",
        "environment": "development"
        }
dbservers = [
        "10.55.102.102",
        "10.55.102.104",
        ]
# loop over the customgroups to create the json array
data = {
    "all": {
        "hosts": managedhosts,
        "vars": hostvars,
        "children": customgroups
    },
}
for group in customgroups:
    data.update({ group: { "hosts": eval(group), "vars": eval(group+"_vars"), "children":[] } })

print(json.dumps(data))
