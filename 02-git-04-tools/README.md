# Домашнее задание к занятию "4. Инструменты Git"

## Задание 1
Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.
### Решение
- `git show aefea`\
Полный хеш коммита `aefead2207ef7e2aa5dc81a34aedf0cad4c32545`, comment `Update CHANGELOG.md`
## Задание 2
1. Какому тегу соответствует коммит `85024d3`?
2. Сколько родителей у коммита `b8d720`? Напишите их хеши.
3. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами `v0.12.23` и `v0.12.24`.
4. Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).
5. Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.
6. Кто автор функции `synchronizedWriters`?
### Решение
1. `git show 85024d3`\
Коммит `85024d3` соответствует тегу `v0.12.23`.
2. `git show b8d720`\
Родители коммита `b8d720` это `56cd7859e0` и `9ea88f22fc`.
3. `git log --all -i --grep='v0.12.23'` и `git log --all -i --grep='v0.12.24'`\
commit `85024d3100126de36331c6982bfaac02cdab9e76`, comment `v0.12.23`\
commit `225466bc3e5f35baa5d07197bbc079345b77525e`, comment `Cleanup after v0.12.23 release`
4. `git log -p --all  -S 'providerSource'`\
Функция `providerSource(services *disco.Disco) getproviders.Source` 
создана `commit 8c928e83589d90a031f811fae52a81be7153e82f`
5. `git log -p --all -S 'globalPluginDirs'`\
Функция `globalPluginDirs` изменена в коммите `fcdb5d2e558b2ea5e1a63713aca2ba9848ad2ada`
6. `git log -p --all  -S 'synchronizedWriters'`\
Автор функции `synchronizedWriters` Martin Atkins