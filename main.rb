if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/test"

answers_path = "#{File.dirname(__FILE__)}/data/answers.txt"

questions_path = "#{File.dirname(__FILE__)}/data/questions.txt"

person = Test.new(questions_path)

person.questions.each do |item|
  user_choice = 0

  puts item

  until user_choice.between?(1,3)
    puts "Введите 1 - \"да\", либо 2 - \"иногда\", либо 3 - \"нет\" и нажмите Ввод"
    user_choice = STDIN.gets.to_i
  end

  person.scoring(user_choice)
end

puts person.result_output(answers_path)


