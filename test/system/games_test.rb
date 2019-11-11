require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Filling form in /new with 11 letters word gives us error" do
    visit new_url
    fill_in "answer", with: "artgrlliskgauie"
    click_on "submit"

    assert_text 'Word is impossible with grid'
  end

  test "1 letter word gives a word is not english" do
    visit new_url
    fill_in "answer", with: "n"
    click_on "submit"

    assert_text "Word doesn't exist"
  end
end
