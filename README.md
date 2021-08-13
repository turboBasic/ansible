New Ansible playbooks
=====================

> 2021 effort to re-create Ansible playbooks for personal use


## Usage

    ./build.sh
    ansible-playbook ansible/python.yaml --limit this
    ansible-playbook ansible/site.yaml --connection local --become
