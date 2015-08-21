require 'rails_helper'

RSpec.describe Answer, type: :model do

  context 'attributes' do
    let(:question) do
      Question.create!( title: "Some Question Title",
                        body: "Some Quesiton Body",
                        resolved: true)
    end
    let (:answer) { Answer.create!( body: "Answer Body", question: question ) }

    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end

  end

end
