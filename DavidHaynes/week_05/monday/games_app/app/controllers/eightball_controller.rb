class EightballController < ApplicationController

def start
end

def result
  @answers = ["Absolutely", "Answer Unclear Ask Later", "Cannot Foretell Now", "Can't Say Now", "Chances Aren't Good", "Consult Me Later", "Don't Bet On It", "Focus And Ask Again", "Indications Say Yes", "Looks Like Yes", "No, No Doubt About It", "Positively", "Prospect Good", "So It Shall Be", "The Stars Say No", "Unlikely", "Very Likely", "Yes", "You Can Count On It"]
  @question = params[:user_question]
  @response = rand(19)
  @result = @answers[@response]
end


end
