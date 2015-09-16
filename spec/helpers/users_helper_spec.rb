require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do

  let(:user) { create(:user) }

  describe "render_user_posts" do
    it "tells us if the user does not have posts" do
      expected_text = "#{user.name} has not submitted any posts yet."
      expect(render_user_posts(user)).to eq expected_text
    end
  end

  describe "render_user_comments" do
    it "tells us if the user does not have comments" do
      expected_text = "#{user.name} has not submitted any comments yet."
      expect(render_user_comments(user)).to eq expected_text
    end
  end

end
