class EnglishWordList < Command
  attr_reader :word_list, :app
  CURRENT_PATH = File.dirname(__FILE__)
  FILE_PATH = '/date/word_english_list.txt'

  def initialize
    @word_list = File.readlines(CURRENT_PATH + FILE_PATH)
    @app = APP
  end

  def self.description
    'программа выводит английские слова и их перевод для изучения'
  end

  def word_hash
    h_words = {}
    word_list.shuffle.each do |string|
      string.chomp!
      string = string.split(' ')
      h_words[string[0].downcase] = string[1..string.size]
    end

    h_words
  end

  def instruction
    <<~END
      ======================================
      Введите перевод на английском
      Введите enter для просмотра перевода
      Введите exit для выхода
      ======================================
    END
  end

  def result_translation(input, word)
    if input == 'exit'
      app.start
    elsif input == ''
      puts 'translation of this word:', word
    elsif input != word
      puts 'It is not right', 'that is right:', word
    else
      puts 'Yes!)'
    end
  end

  def words_of_translation
    word_hash.each do |word, translation|
      puts instruction
      puts translation
      input = gets.chomp.downcase
      result_translation(input, word)
    end
  end

  def call
    words_of_translation
  end
end
