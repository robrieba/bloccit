require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:question) { Question.create!(title: "Question Title", body: "Question Body", resolved: false) }

  context "attributes" do
    it "should respond to title" do
      expect(question).to respond_to(:title)
    end
    it "should respond to body" do
      expect(question).to respond_to(:body)
    end
    it "should respond to resolved" do
      expect(question).to respond_to(:resolved)
    end
  end


end
