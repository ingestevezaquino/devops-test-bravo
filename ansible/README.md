# ANSIBLE

This directory contains a playbook which meets this requirements:

    1.    Docker.
    2.    Docker compose.
    3.    Chrony y que apunte a un servidor diferente al que viene por defecto.
    4.    Ping, netstat y wget.
    5.    Agregar un usuario y darle permisos de sudo.
    6.    Firewall activo y permitir el acceso por los puertos 8080, 8081 y 443.

In order to execute this playbook you need to make sure that you have set your target machine correctly on `hosts` file, as well as, 
to specify a **remote user which has root permissions** and that is able log in to target machine (`ansible.cfg`).

Once you have configured requirements corretly, you can run the playbook with: `ansible-playbook main.yml` command.

You can also modify playbook variables to custom the username of the new user or the port in which Jenkins will start (if executing the corresponding tasks).

![image](https://github.com/ingestevezaquino/devops-test-bravo/assets/74105278/bca9bd0f-5c6f-44aa-9310-22461c0074ac)

---

In this playbook you have additional tasks which are commented, but you could execute them if you'd need to.

You'll find them at the end of `main.yml` file.

![image](https://github.com/ingestevezaquino/devops-test-bravo/assets/74105278/b4f46b66-4378-4991-8900-51376a7b7650)
