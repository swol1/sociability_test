class Test
  attr_reader :questions, :answer_points

  def initialize(questions)
    @answer_points = 0
    @questions = questions
  end

  def scoring(user_choice)
    case user_choice
    when 1
      @answer_points += 1
    when 2
      @answer_points += 2
    end
  end

  def result_output(answers)
    case answer_points
    when 0..3
      answers[0]
    when 4..8
      answers[1]
    when 9..13
      answers[2]
    when 14..18
      answers[3]
    when 19..24
      answers[4]
    when 25..29
      answers[5]
    when 30..32
      answers[6]
    end
  end
end
