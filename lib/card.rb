class Card
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def question
    "#{@question}"
  end

  def answer
    "#{@answer}"
  end

  def category
    "#{@category}".to_sym
  end

end
