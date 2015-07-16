# test user, like and link creation
feature "user management" do
  describe "sign up" do
      visit "/"
      click_button("Sign up")
      fill_in "username", with: "nomathanjg"
      fill_in "email", with: "jon@email.com"
      fill_in "password" with: "password"
      fill_in "password-confirmation", with: "password"
      click_button("Sign up")
      expect(page).to have_content("hello nomathanjg")
    end
  end
end