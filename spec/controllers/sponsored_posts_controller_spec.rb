require 'rails_helper'
include RandomData

=begin
topic_sponsored_posts     POST   /topics/:topic_id/sponsored_posts(.:format)          sponsored_posts#create
new_topic_sponsored_post  GET    /topics/:topic_id/sponsored_posts/new(.:format)      sponsored_posts#new
edit_topic_sponsored_post GET    /topics/:topic_id/sponsored_posts/:id/edit(.:format) sponsored_posts#edit
 topic_sponsored_post     GET    /topics/:topic_id/sponsored_posts/:id(.:format)      sponsored_posts#show
                          PATCH  /topics/:topic_id/sponsored_posts/:id(.:format)      sponsored_posts#update
                          PUT    /topics/:topic_id/sponsored_posts/:id(.:format)      sponsored_posts#update
                          DELETE /topics/:topic_id/sponsored_posts/:id(.:format)      sponsored_posts#destroy
=end

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new post to @sponsored_post" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

    it "redirects to the new post" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      sponsored_post_instance = assigns(:sponsored_post)
      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsored_post to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "DELETE destroy" do
    it "deletes the sponsored post" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
      count = SponsoredPost.where({id: my_sponsored_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to redirect_to my_topic
    end
  end

end
