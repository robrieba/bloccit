require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:question) do
    Question.create!(  title: "New Question Title",
                        body: "New Quesiton Body",
                        resolved: false)
  end

  context "attributes" do
    it "should respond to title" do
      expect(question).to respond_to(:title)
    end

    it "should respond to body" do
      expect(question).to respond_to(:body)
    end

  end

end
