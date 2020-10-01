class EnglishWordList < Command
  attr_accessor :word_list

  def initialize
    current_path = File.dirname(__FILE__)
    file_path = '/date/word_english_list.txt'
    @word_list = File.readlines(current_path + file_path)
  end

  def self.name_command
    'eng-wl'
  end

  def description
    'программа выводит английские слова и их перевод для изучения'
  end

  def command_work
    arr_word = []
    word_list.each do |string_word|
      string_word.chomp!
      words = string_word.split(' ')
      arr_word << words[0]
    end

    arr_word
  end
end
