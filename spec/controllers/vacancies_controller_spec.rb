require "rails_helper"

RSpec.describe VacanciesController, :type => :controller do

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
    post :create, vacancy: {name: 'Name 1', date_until: Date.today.days_since(2)}
    puts assigns[:vacancy].errors.full_messages
    expect(response).to redirect_to(vacancy_path(assigns[:vacancy]))
  end

  it "GET #show" do
    vacancy = create(:vacancy)
    get :show, id: vacancy.id
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "GET #edit" do
    vacancy = create(:vacancy)
    get :edit, id: vacancy.id
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "#update" do
    vacancy = create(:vacancy)
    put :update, id: vacancy.id, vacancy: { name: 'name2' }
    expect(response).to redirect_to(vacancy_path(assigns[:vacancy]))
    expect(assigns[:vacancy].name).to eq('name2')
  end

  it "#destroy" do
    vacancy = create(:vacancy)
    delete :destroy, id: vacancy.id
    expect(response). to redirect_to(vacancies_path)
    expect(Vacancy.count).to eq(0)
  end
end