RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # for spring
  config.before(:all) do
    FactoryGirl.reload
  end
end


