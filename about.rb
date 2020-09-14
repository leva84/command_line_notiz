class About < Command
  DATA_PATH = '/README.md'

  def self.print_command
    if File.exist?(file_path)
      File.open(file_path, 'r') do |f|
        f.readlines.compact
      end
    else
      'Файл не найден'
    end
  end

  def self.file_path
    current_path = File.dirname(__FILE__)
    current_path + DATA_PATH
  end
end
