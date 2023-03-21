use the directory as an inventory source and every file is treated as an executable and executed.
the resulting inventory contains entry from every file

    [dataylor@yogac940 ansible-repos]$ ./inventories/example-inventory-script.py
    {"all": {"hosts": ["10.55.102.78", "10.55.102.51"], "vars": {"var1": "true", "environment": "production"}, "children": ["webservers", "dbservers"]}, "webservers": {"hosts": ["10.55.102.101"], "vars": {}, "children": []}, "dbservers": {"hosts": ["10.55.102.102", "10.55.102.104"], "vars": {"var1": "not true", "environment": "development"}, "children": []}}

    [dataylor@yogac940 ansible-repos]$ ./inventories/example-inventory-script.sh
    {
        "all": {
            "hosts": ["10.55.102.22","10.55.102.23","10.55.102.24"],
            "vars": {
                "var1": true
            },
            "children": ["special"]
        },
        "special": {
            "hosts": ["10.55.102.25"],
            "vars": {
                "var2": 500
            },
            "children":[]
        }
    }

    dataylor@yogac940 ansible-repos]$ ansible-playbook -i inventories/ test.yml 

    PLAY [all] *****************************************************************************************************************************

    TASK [dump the inventory hosts] ********************************************************************************************************

    TASK [dump the inventory hosts] ********************************************************************************************************
    ok: [10.55.102.78] => {
        "ansible_play_hosts_all": [
            "10.55.102.78",
            "10.55.102.51",
            "10.55.102.22",
            "10.55.102.23",
            "10.55.102.24",
            "10.55.102.101",
            "10.55.102.102",
            "10.55.102.104",
            "10.55.102.25"
        ]
    }
    TASK [dump the groups] *****************************************************************************************************************
    ok: [10.55.102.51] => {
        "groups": {
            "all": [
                "10.55.102.78",
                "10.55.102.51",
                "10.55.102.22",
                "10.55.102.23",
                "10.55.102.24",
                "10.55.102.101",
                "10.55.102.102",
                "10.55.102.104",
                "10.55.102.25"
            ],
            "dbservers": [
                "10.55.102.102",
                "10.55.102.104"
            ],
            "special": [
                "10.55.102.25"
            ],
            "ungrouped": [
                "10.55.102.78",
                "10.55.102.51",
                "10.55.102.22",
                "10.55.102.23",
                "10.55.102.24"
            ],
            "webservers": [
                "10.55.102.101"
            ]
        }
    }

