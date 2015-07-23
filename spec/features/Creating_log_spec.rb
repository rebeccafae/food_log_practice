require 'rails_helper'

feature 'Food log management' do
  scenario 'User adds food to log' do
    log = FactoryGirl.create(:log)

    visit 'logs/new'

    fill_in "Meal", :with => log.meal
    select '08', from: 'log_time_of_meal_4i'
    select '40', from: 'log_time_of_meal_5i'
    fill_in "Food", :with => log.food

    click_button "Create"

    expect(page).to have_content("Food was successfully created.")
  end


  scenario 'User views their log' do
    log = FactoryGirl.create(:log)
    log2 = FactoryGirl.create(:log)

    visit "/logs"

    expect(page).to have_content(log.meal)
    expect(page).to have_content(log.time_of_meal)
    expect(page).to have_content(log.food)

    expect(page).to have_content(log2.meal)
    expect(page).to have_content(log2.time_of_meal)
    expect(page).to have_content(log2.food)
  end


  scenario 'User edits an existing log' do
    log = FactoryGirl.create(:log)

    visit "/logs/#{log.id}/edit"

    fill_in "Meal", :with => log.meal
    select '08', from: 'log_time_of_meal_4i'
    select '40', from: 'log_time_of_meal_5i'
    fill_in "Food", :with => log.food

    click_button 'Update'

    expect(page).to have_content('Log was successfully updated.')
  end
end
