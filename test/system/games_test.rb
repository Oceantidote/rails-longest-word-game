require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /guess gives us a new random grid to play with" do
    visit guess_url
    assert test: "New game"
    assert_selector "li", count: 10
  end
end

class ScoreTest < ApplicationSystemTestCase
  test "Going to /score gives us 3 paragraph elements" do
    visit guess_url
    fill_in "user_guess", with: "Hello"
    click_on "Play"

    take_screenshot
    assert_text "Not in the grid!"
  end
end

