require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  it "GET #index" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "GET #new" do
    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "POST #create" do
    post :create, user: {name: 'Один Два Три', contact: 'example@example1.com'}
    expect(response).to redirect_to(user_path(assigns[:user]))
  end

  it "GET #show" do
    user = create(:user)
    get :show, id: user.id
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "GET #edit" do
    user = create(:user)
    get :edit, id: user.id
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "#update" do
    user = create(:user)
    put :update, id: user.id, user: { name: 'Имя Имя Имя' }
    expect(response).to redirect_to(user_path(assigns[:user]))
    expect(assigns[:user].name).to eq('Имя Имя Имя')
  end

  it "#destroy" do
    user = create(:user)
    delete :destroy, id: user.id
    expect(response). to redirect_to(users_path)
    expect(User.count).to eq(0)
  end
end