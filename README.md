# devops-netology
В результате добавления .gitignore в terraform будут проигнорированы:

`**/.terraform/*` все папки с директорией .terraform и все что в них содержится.


`"*.tfstate"` все файлы расширением .tfstate

`*.tfstate.*` все файлы в имени которых есть .tfstate, но которые заканчиваются не на .tfstate

`crash.log` файл crash.log 

`crash.*.log` файл crash, в имени которого до расширения есть другое имя, например crash.24072023.log

`*.tfvars` все файлы с расширением .tfvars

`*.tfvars.json` все  файлы заканчивающиеся на .tfvars.json

`override.tf` файл override.tf

`override.tf.json` файл override.tf.json

`*_override.tf` все файлы, заканчивающиеся на _override.tf

`*_override.tf.json` все файлы, заканчивающися на _override.tf.json

`# !example_override.tf` данная строка будет проигнорирована

`# example: *tfplan*` данная строка будет проигнорирована

`.terraformrc` файл .terraformrc

`terraform.rc` файл terraform.rc