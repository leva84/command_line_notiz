# command_line_notiz
 [https://github.com/leva84/command_line_notiz]
 программа написана на чистом Ruby и может использоваться только при запуске из командной строки.

## Назначение
 - Программа предназначена для добавления
  произвольных команд(с помощью скрипта Ruby),
  и дальнейшего их использования. 
 - Программу возможно использовать в любых проектак Ruby,
  для тестирования часто повторяющегося кода
  для автоматизации рутинных задач.
 - Так же можно использовать как кастомизированный
  помошник при зозданиии автоматических задачь в проекте.

## Использование
 - запустить приложение командой `./repl` из корневой папки приложения, либо `/path_to/repl`
 - после `help` выведет список доступных комманд и описание их работы

## Добавление команд
  Добавить команду можно следующим образом: 
  - создать файл `name_class_your_command.rb` в директории `/lib`
  - подключить файл в `command_line_notiz/lib/app.rb` с помощью `require 'commands/name_class_your_command'`,
  данную строчку следует вставить в начало файла, ниже остальных подключений.
  ```
    require 'command_registry'
    require 'commands/english_word_list'

    ...
  ```
  - зарегистрировать класc необходимо следующим образом - в методе `registry` класса `App`
   (расположен - `command_line_nitiz/lib/app.rb`) необходимо вставить следующее:
  `registry.register_command('your_command_name', YourClassName)`
  - в файл `lib/commands/your_command_class_name.rb` внести обязательные методы, для корректной работы программы.
  Так должен выглядеть шаблон вашего класса:
  ```
     class NameClassYourCommand < Command    
      def description
        # description work command
      end
    
      def call
        # command work result
      end
    end
  ```