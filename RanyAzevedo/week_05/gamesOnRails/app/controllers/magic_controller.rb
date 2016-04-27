class MagicController < ApplicationController

  def play
  end

  def result
    @question = params[:magic_question]
    answerArray = ["Of course, don't even need to ask!", "I'm not sure about it..", "Waiiit, what are you talking about??", "No, definitely no!" ]
    @answer = answerArray.sample
    redirect_to '/magic' if @question ==  ""

  end

end
