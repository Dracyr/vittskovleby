module SignInHelper
  def sign_in(user)
    visit new_user_session_path
    fill_form(:user, {email: user.email, password: "testtest"})
    click_button 'Sign in'
  end
end
