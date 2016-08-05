require 'rails_helper'

feature 'Visitor send message to guide' do
  scenario 'successfully' do
    guide = create :guide
    tour = create :tour, guide: guide

    message = build :message, tour: tour

    visit tour_path(tour)

    fill_in 'Nome', with: message.name
    fill_in 'Telefone', with: message.phone
    fill_in 'Email', with: message.email

    fill_in 'Deixe uma mensagem', with: message.text_msg

    click_on 'Enviar'

    expect(page).to have_content message.name
    expect(page).to have_content message.phone
    expect(page).to have_content message.email
    #    expect(page).to have_content message.date_tour
    expect(page).to have_content message.text_msg
    #  expect(page).to have_content guide.name
  end
end
