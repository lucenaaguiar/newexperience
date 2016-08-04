require 'rails_helper'

feature 'Visitor view guides' do
  scenario 'successfully' do
    guides = create_list :guide, 5

    visit root_path

    click_on 'Guias'

    guides.each do |guide|
      expect(page).to have_link guide.name
      expect(page).to have_content guide.email
    end
  end

  scenario 'with no guides' do
    visit guides_path

    expect(page).to have_content 'Nenhum Guia cadastrado.'
  end
end
