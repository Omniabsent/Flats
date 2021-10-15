require 'rails_helper'

describe 'Place owner authentication' do
  it 'cannot create place without being loged in' do
    post '/places'

    expect(response).to redirect_to(new_place_owner_session_path)

  end

  it 'cannot open new place form unless authenticated' do
    get '/places/new'

    expect(response).to redirect_to(new_place_owner_session_path)
  end
end
