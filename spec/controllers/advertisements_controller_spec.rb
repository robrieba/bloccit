require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do

  let(:ad) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns ad to @advertisements" do
      get :index
      expect(assigns(:ad)).to eq([ad])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "increases the number of Advertisements by 1" do
      expect { post :create, advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 } }.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
      post :create, advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 }
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 0 }
      expect(response).to redirect_to Advertisement.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: ad.id}
      expect(assigns(:advertisement)).to eq(ad)
    end
  end



end


=begin
require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
' ********************************
'  Main Loop
' ********************************

      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
=end
