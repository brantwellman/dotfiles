gem_group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 5.0"
end

gem_group :development, :test do
  gem "pry-rails", comment: "CONSOLIDATE GEMS INTO EXISTING GEM BLOCK"
  gem "rspec-rails", "~> 7.0.0"
  gem "factory_bot_rails"
  gem "faker"
end

# Bundle and set up RSpec
run "bundle install"
run "rails generate rspec:install"

# Setup Shoulda Matchers
append_to_file "spec/rails_helper.rb" do
  "\nShoulda::Matchers.configure do |config|\n  config.integrate do |with|\n    with.test_framework :rspec\n    with.library :rails\n  end\nend"
end

# Configure FactoryBot
insert_into_file "spec/rails_helper.rb", after: "RSpec.configure do |config|\n" do
  "  # Include Factory Bot syntax to simplify calls to factories\n  config.include FactoryBot::Syntax::Methods\n\n"
end

# Set up the spec folders for RSpec and factories
run "mkdir spec/models"
run "mkdir spec/factories"
run "touch spec/factories/things.rb"

# Add a basic factory to the things factory file
append_to_file "spec/factories/things.rb" do
  "\n# RENAME FILE, AND FACTORY\nFactoryBot.define do\n  factory :thing do\n\n  end\nend\n"
end

# Make initial commit
after_bundle do
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
