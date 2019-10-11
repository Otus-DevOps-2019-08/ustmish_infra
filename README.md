# ustmish_infra
ustmish Infra repository

bastion_IP = 35.210.32.82
someinternalhost_IP = 10.132.0.3

Host bastion
Hostname 35.210.32.82
User ustmish

Host someinternalhost
ProxyCommand ssh bastion nc 10.132.0.3 22



testapp_IP = 35.195.136.64
testapp_port = 9292

в ходе данной работы было сделано:

- установка ruby
- установка,запуск и включение автозапуска сервиса mongod
- деплой приложения
- созданы скрипты по настройке системы и деплоя приложения
- сделан start script(install.sh) для использование при создании инстанца при помощи gcloud
- создано правило брандмаэура с помощью gcloud

проверка:

создать правило брандмаура командой 
gcloud compute firewall-rules create default-puma-server2 \
--allow tcp:9292 \
--target-tags=puma-server2

создать новый инстанс командой 

gcloud compute instances create reddit-app6 \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server2 \
--restart-on-failure \
--metadata-from-file startup-script=install.sh

сделать запрос http://address:9292


ДЗ 5

в ходе данной работы было сделано:

-- новая ветка packerbase
-- установлен packer
-- packer настроен для работa c gcp
-- создан шаблон ubuntu16.json и создан образ на основе этого шаблона
-- создан экземпляр на основе этого образа
-- сделан деплой приложения на этом экземпляре
-- ID проекта, source_image_family, machine_type параметризированы
-- добавлены новые атрибуты в шаблоны
-- сделан новый шаблон (bake подход) с деплоем приложения и запуском puma
-- с помощью gcloud создан экземаляр из консоли


проверка 

сделать запрос http://35.240.74.114:9292/


дз 6

 В процессе сделано:
- создана новая ветка terraform-1
- установлен  terraform
- сделана подготовительня часть
- Определена input переменную для приватного ключа,
использующегося в определении подключения для
провижинеров (connection)
- Определена input переменную для задания зоны в ресурсе
"google_compute_instance" "app"
- отформатированы все конфигурационные файлы с помощью terraform fmt


