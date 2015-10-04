class Response
  @@responses = []
  @@yelling_mode = false # we are telling it to start out at false
  @@counter = 0

  def self.add_response question, *answers
    @@responses << new(question, answers)
  end

  def self.add_dummies *answers
    @@responses << new("$$", answers)
  end

  def self.get_dummies
    ['Tell me more.', "That's interesting.", 'Go on.']
    #@@responses.select{|r| r.good_for? "$$"}
  end

  def self.get_answer question
    if question.include?("!")
      @@yelling_mode = !@@yelling_mode
      # if @@yelling_mode == false # because it starts out in false
      #   @@yelling_mode = true
      # elsif @@yelling_mode == true
      #   @@yelling_mode = false
      # end
    end
    @@counter = @@counter + 1
    if @@counter > 10
      "Let's get in to that next session."
    else
      responses = @@responses.select{|r| r.good_for? question}
      if responses.length > 0
        if @@yelling_mode #for reg. responses
          responses.sample.get_answers.sample.upcase
        else
          responses.sample.get_answers.sample
        end
      else
        # responses => one or more Response instances
        # responses.sample => a Response instance out of responses
        # responses.sample.get_answers => the array of strings from a
        # responses.sample.get_answers.sample => a string from the array of strings "anwer 2"
        if @@yelling_mode #for dummies
          Response.get_dummies.sample.get_answers.sample.upcase
        else
          Response.get_dummies.sample.get_answers.sample
        end
      end
    end
  end

  def initialize question, answers
    @question = question.downcase
    @answers = answers

  end

  def good_for? question
    question.downcase.include? @question
  end

  def get_answers
    @answers
  end

  def self.get_yelling_mode
    @@yelling_mode
  end



















end
