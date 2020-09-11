require_relative 'lib/storage'
require_relative 'lib/command_line'

p " - Введите команду либо введите 'help' для просмотра доступных команд"
p " - 'exit' для выхода"
p " - Для добавления команды введите 'add'"

print ' > '
command = STDIN.gets.chomp!

if command == 'help'
  Storage.new.print_commands.each_with_index { |com, ind| p "#{ind + 1}  #{com.chomp}" }
elsif command == 'add'
  p ' - Введите команду, которую неоюходимо добавить в программу'
  p ' - Длинна команды должна быть более 1-го символа'
  p " - Либо 'Enter' для выхода"
  print ' > '
  str = STDIN.gets
  p Storage.new.recording_command(str)
elsif command == 'exit'
  abort
else
  p CommandLine.new(command).result
end
