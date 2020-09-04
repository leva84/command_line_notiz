def result(command)
  IO.popen("#{command}") { |answer| answer.read.chomp }
end

def print_commands
  current_path = File.dirname(__FILE__)
  file_path = current_path + "/data/ls_commands.txt"

  if File.exist?(file_path)
    File.open(file_path, 'r') { |f| f.readlines }
  else
    "Файл не найден"
  end
end

def recording_commands(str)
  file_path = "/data/ls_commands.txt"

  if File.exist?(file_path)
    File.open(file_path, 'w') { |f| f.write("#{str}") }
  else
    "Файл не найден, запись невозможна"
  end
end
