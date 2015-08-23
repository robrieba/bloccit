
#Rails generate model Advertisement title:string, copy:text, price:integer

require 'rails_helper'

RSpec.describe Advertisement, type: :model do

  let(:ad) { Advertisement.create!(title: "This is a Title", copy: "This is the copy.", price: 0) }

  context "attributes" do

    it "should respond to title" do
      expect(ad).to respond_to(:title)
    end

    it "should respond to copy" do
      expect(ad).to respond_to(:copy)
    end

    it "should respond to price" do
      expect(ad).to respond_to(:price)
    end

  end

end
