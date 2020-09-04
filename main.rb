require 'io/console'
require_relative 'lib/methods'

# шаг1: Приветствие для пользователя и краткая инструкция.
puts "Введите команду либо введите 'help' для просмотра доступных команд, 'exit' для выхода"

# шаг2: Принять, запрос пользователя.
command = nil

#while command == '' || command == 'exit'
  print '>'
  command = STDIN.gets
  #end

# шаг3: Результат работы команды, переход к шагу 1
p result(command)
