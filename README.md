# Terraform
1. Подготовьте шаблон с Alma 9, на неё необходимо установить qemu-guest-agent, а также при желании cloud-init. Добавьте их в автозагрузку.
2. Укажите следующие параметры ВМ:
  - имя VM в переменной vm_name
  - ID кластера в переменной cluster_id
  - ID шаблона в переменной template_id
*Note*: по умолчанию ВМ выдаётся 4 процессорных ядра и 8GB оперативной памяти, при желании можно сменить с помощью параметров cpu_[cores, sockets, threads] и memory (значение задаётся в мегабайтах).
3. Создайте файл credentials.auto.tfvars со следующим содержимым
```
ovirt_url      = "https://ovirt.engine.local/ovirt-engine/api"  # Укажите актуальный URL API oVirt
ovirt_username = "admin@internal"                               # Имя пользователя oVirt с указанием пространства имён
ovirt_password = "admin"                                        # Пароль пользователя
ovirt_tls_ca   = ["/path/to/ovirt/ca.cer"]                      # Путь к корневому сертификату oVirt
```
4. Проинициализируйте Terraform
5. Примените Terraform

# Ansible
1. Если вы изменяли значение параметра `name` у тега oVirt, поправьте в Ansible Playbook hosts на нужный тег в формате `prefix tag_ + tag-value`
2. Отредактируйте ansible/inventory/ovirt.yaml, в нём нужно исправить следующие параметры:
```
ovirt_url: "https://ovirt.engine.local/ovirt-engine/api"  # Укажите актуальный URL API oVirt
ovirt_username: admin@internal                            # Имя пользователя oVirt с указанием пространства имён
ovirt_password: admin                                     # Пароль пользователя
ovirt_cafile: "/path/to/ovirt/ca.cer"                     # Путь к корневому сертификату oVirt
```
3. Убедитесь, что Ansible обнаружил созданную ВМ с помощью ansible-inventory
4. Запустите playbook awx.yaml
```
ansible-playbook awx.yaml
```
