
class Card
  attr_reader :question, :answer, :hint

  def initialize(question, answer, hint = nil)
    @question = question
    @answer = answer
    @hint = hint
  end

end
