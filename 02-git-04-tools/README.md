# Домашнее задание к занятию "2.4. Инструменты Git"

## Задание 1
Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
### Решение
- `git show aefea`\
Полный хеш коммита `aefead2207ef7e2aa5dc81a34aedf0cad4c32545`, comment `Update CHANGELOG.md`
## Задание 2
- Какому тегу соответствует коммит `85024d3`?
- Сколько родителей у коммита `b8d720`? Напишите их хеши.
- Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами `v0.12.23` и `v0.12.24`.
- Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).
- Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.
Кто автор функции `synchronizedWriters`?
### Решение
- `git show 85024d3`\
Коммит `85024d3` соответствует тегу `v0.12.23`.
- `git show b8d720`\
Родители коммита `b8d720` это `56cd7859e0` и `9ea88f22fc`.
- `git log --all -i --grep='v0.12.23'` и `git log --all -i --grep='v0.12.24'`\
commit `85024d3100126de36331c6982bfaac02cdab9e76`, comment `v0.12.23`\
commit `225466bc3e5f35baa5d07197bbc079345b77525e`, comment `Cleanup after v0.12.23 release`

- Функция `providerSource(services *disco.Disco) getproviders.Source` 
создана `commit 8c928e83589d90a031f811fae52a81be7153e82f`
- `git log -p --all -S 'globalPluginDirs'`
Функция `globalPluginDirs` изменена в коммите `fcdb5d2e558b2ea5e1a63713aca2ba9848ad2ada`