module ControllerMacros
  def login_user    
    before(:each) do
      user = User.create! do |u|
        u.email     = 'test@test.com'
        u.password    = 'password'
      end
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end