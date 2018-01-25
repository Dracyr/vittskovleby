module SignInHelper
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user] if @request
      admin = FactoryBot.create(:admin)
      sign_in :user, admin
    end
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user] if @request
    user ||= FactoryBot.create(:user)
    sign_in user
  end
end
