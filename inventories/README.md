use the directory as an inventory source and every file is treated as an executable and executed.
the resulting inventory contains entry from every file

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

