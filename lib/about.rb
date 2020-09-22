class About < Command
  def initialize
    super
  end

  def self.name_command
    'about'
  end

  def self.description
    'описание программы и ее окружения'
  end

  def self.result_work
    current_path = File.dirname(__FILE__)
    path = current_path[0..current_path.size - 4]
    system('cat ' + path + '/README.md') { |answer| p answer.readlines }
  end
end
