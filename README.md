# command_line_notiz  [v1.5]
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

## Установка
 - Подходят все версии Ruby не ниже 2.0.
 - После установки Ruby необходимо скачать каталог с программойи.
 - Папку с программой поместить в необходимый проект или дерикторию для удобной работы.
  
## Использование
  - Запустить программу `ruby app.rb` либо `ruby /path_to/app.rb `
  если запуск программы происходит не из директории размещения программы.
  - После запуска пользователь увидит приглашение для ввода команды.
  - `help` запросить пречень всех доступных и зарегистрированных команд с описанием их работы
  - `about` запросить описание программы
  
## Добавление команд
  Добавить команду можно следующим образом: 
  - создать файл `name_class_your_command.rb` в директории `/lib`
  - подключить файл в `command_line_notiz/app.rb` с помощью `require_relative 'lib/name_class_your_command'`,
  данную строчку следует вставить в начало файла, ниже остальных подключений.
  ```
    require_relative 'lib/command'
    require_relative 'lib/about'
    require_relative 'lib/help'
  ```
  - зарегистрировать клас необходимо следующим образом - в методе `initialize` класса `App`
   (расположен в файле `command_line_nitiz/app.rb`) необходимо вставить следующее:
  `@registry.register_command('command_your_name', ClassYourName)`
  - в файл внести обязательные методы, для корректной работы программы.
  Так должен выглядеть шаблон вашего класса:
  ```
     class NameClassYourCommand < Command
      def initialize
        # initialize your class
      end
    
      def description
        # description work command
      end
    
      def call
        # command work result
      end
    end
  ```  
 - метод `initialize` можно опустить, за ненадобностью либо дописать свою реализацию инициализации вашего класса
 - метод `description` возвращает строковое значение - описание работы вашей команды, будет появляться при вызове команды
  `help` и обяснять пользователю для чего нужна данная команда
 - метод `call` возвращает результат работы вашего класса(команды). Добавление других методов в код вашего класса, только на ваше усмотрение,
  если этого требует работа команды, то добавте необходимое в код. Но конечный результат должен быть
  в этом методе. что бы его могла отобразить программа.
  - !!! обратите внимание, что название класса команды записывется в соответсвии с codstyeel Ruby
  каждое новое слово в названии начинается с большой буквы и в единственном числе. Название команды записывается 
  относительно ваших предпочтений, как вым удобно будет её вызывать.
  
 ## Пример
 Для наглядного примера в программе приведен класс `EnglishWordList` (команда создана для изученя английских слов, она
 предлагает пользователю ввести слова на аглийском, когда выводит перевод слова на руском).
 В нём наглядно показаны, основные приемы сборки и кастомизации своих классов для выполнения команд в данном приложении.
 Для необходимости программист может добавить дополнительные классы к классу команды и подключить их по аналогии с
 остальными подключениями. Важно понимать, что только основной класс команды, необходимо сделать потомком класса `Command`.
  