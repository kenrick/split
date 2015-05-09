require 'rails_helper'

RSpec.feature 'Signing in with github' do

  background do
    OmniAuth.config.add_mock(:github, uid: "12345", info: { name: 'john' })
  end

  scenario 'sign in for the first time' do
    expect(User.count).to eq(0)

    visit '/'
    click_link I18n.t('shared.header.sign_in_with_github')

    expect(page).to have_content('Signed in sucessfully')
    expect(page).to have_content('Howdy john!')
    expect(User.count).to eq(1)
    expect(User.last.uid).to eq("12345")
  end

  scenario 'sign in as existing user' do
    create :user

    visit '/'
    click_link I18n.t('shared.header.sign_in_with_github')

    expect(page).to have_content('Signed in sucessfully')
    expect(User.count).to eq(1)
  end
end

