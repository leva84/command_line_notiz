# frozen_string_literal: true

require_relative 'command'

p " - Введите команду либо введите 'help' для просмотра доступных команд"
p " - 'exit' для выхода"
p " - Для добавления команды введите 'add'"

print ' > '
command = STDIN.gets.chomp!

if command == 'help'
  Command.arr_command.each_with_index { |com, ind| p "#{ind + 1}) - \"#{com.name.downcase}\" #{com.print_command}"}
elsif command == 'add'
  p ' - Введите команду, которую неоюходимо добавить в программу'
  p ' - Длинна команды должна быть более 1-го символа'
  p " - Либо 'Enter' для выхода"
  print ' > '
  str = STDIN.gets
  #p Storage.new.recording_command(str)
  p Command.new.create_command(str)
elsif command == 'exit'
  abort
else
  p Command.new
end
