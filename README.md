# Anesthesia: Penetration Testing Workstation Setup

## Overview

**Anesthesia** is an Ansible-based automation project designed to streamline the setup of a penetration testing workstation. This project allows users to configure their workstation based on their specific needs by defining the necessary packages and configurations in the `packages.yml` file. The provided `setup.yml` Ansible playbook can be executed with elevated privileges using `-ask-become`.

## Getting Started

### Prerequisites

Before running the Ansible playbook, ensure the following prerequisites are met:

- [Ansible](https://www.ansible.com/) is installed on your system.
- The `packages.yml` file is configured with the desired packages and configurations.
- An inventory file (`inventory`) with hostnames of the target machines.

### Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/Anesthesia.git
    cd Anesthesia
    ```

2. Edit `inventory`:

    Create an inventory file (`inventory`) and define the target machine(s) for the playbook by specifying hostnames. For example:

    ```inventory
    [workstation]
    127.0.0.1
    [workstation2]
    192.168.1.1
    ```

3. Edit `packages.yml`:

    Open the `packages.yml` file and customize the list of packages and configurations according to your needs.

4. Run the Ansible playbook:

    Execute the following command, and provide elevated privileges when prompted:

    ```bash
    ansible-playbook  setup.yml -K
    ```

    This will initiate the setup based on the configurations in `packages.yml`.

## Customization

### packages.yml

The `packages.yml` file is the core configuration file where you can define the packages and configurations to be installed. Customize this file according to your preferences.

### Contributing

Feel free to contribute to this project by opening issues or submitting pull requests. Your feedback and suggestions are highly appreciated.
