# frozen_string_literal: true

require_relative 'command'

p " - Введите команду либо введите 'help' для просмотра доступных команд"
p " - 'exit' для выхода"
p " - Для добавления команды введите 'add'"

print ' > '
command = STDIN.gets.chomp!

if command == '' || command == 'exit'
  abort
elsif command == 'add'
  p ' - Введите команду, которую неоюходимо добавить в программу'
  p ' - Длинна команды должна быть более 1-го символа'
  p " - Либо 'Enter' для выхода"
  print ' > '
  name_new_command = STDIN.gets.chomp!

  p 'Введите описание команды(для чего она? что делает?)'
  description_command = STDIN.gets.chomp!

  p 'Введите работу(код) команды'
  result_of_command_work = STDIN.gets.chomp!

  p Command.new.create_command(name_new_command, description_command, result_of_command_work)
else
  Command.start_command(command)
end
