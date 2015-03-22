require 'spec_helper'

describe LandmarksController do
  before do
    Landmark.create(name: 'BQE', year_completed: '1961')
  end

  after do
    Landmark.destroy_all
  end

  it "allows you to create a new landmark" do
    landmark = Landmark.create(name: "Chrysler Building", year_completed: 1930)
    expect(Landmark.find(landmark.id)).to eq(landmark)
    expect(landmark.year_completed).to eq(1930)
  end

  it "allows you to list all landmarks" do
    get '/landmarks'
    expect(last_response.status).to eq(200)
  end

  it "allows you to see a single landmark" do
    @landmark = Landmark.first.id
    get "/landmarks/#{@landmark}"
    expect(last_response.status).to eq(200)
  end

  it "allows you to edit a single landmark" do
    post "/edit/#{Landmark.first.id}", {'landmark[name]' => 'Brooklyn Bridge', 'landmark[year_completed]' => 1950}
    follow_redirect!
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Brooklyn Bridge")
  end
end
