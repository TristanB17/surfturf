# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/channels/application_cable/channel.rb'
  add_filter 'app/channels/application_cable/connection.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/mailers/application_mailer.rb'
end
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# Geocoder.configure(lookup: :test, ip_lookup: :test)

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  Geocoder::Lookup::Test.add_stub(
    "1600 Pennsylvania Ave", [
    { data:
      {
        'lat'                 => '32.051544',
        'lon'                 => '-74.0059731',
        'display_name'        => '1600, Pennsylvania Avenue, Avon Park, Savannah, Chatham County, Georgia, 31404, USA'
      }
    },
    { data:
      {
        'lat'                 => '28.243052',
        'lon'                 => '-81.28257',
        'display_name'        => '1600, Pennsylvania Avenue, Saint Cloud, Osceola County, Florida, 34769, USA'
      }
    }
   ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Huntington Beach", [
    { data:
      {
        'lat'                 => '33.6783336',
        'lon'                 => '-118.0000166',
        'display_name'        => 'Huntington Beach, Orange County, California, USA'
      }
    },
    { data:
      {
        'lat'                 => '40.8978759',
        'lon'                 => '-73.3834519',
        'display_name'        => 'Huntington Beach, Suffolk County, New York, 11721, USA'
      }
    },
    { data:
      {
        'lat'                 => '37.016649',
        'lon'                 => '-76.4558862',
        'display_name'        => 'Huntington Beach, Mercury Boulevard, Huntington Heights, Newport News, Newport News City, Virginia, 23605, USA'
      }
    },
    { data:
      {
        'lat'                 => '33.6668083',
        'lon'                 => '-117.901783183911',
        'display_name'        => 'Huntington Beach, Arlington Drive, Costa Mesa, Orange County, California, 92626, USA'
      }
    },
    { data:
      {
        'lat'                 => '41.4908617',
        'lon'                 => '-81.934592',
        'display_name'        => 'Huntington Beach, Lake Road, Bay Village, Cuyahoga County, Ohio, 44140, USA'
      }
    },
    { data:
      {
        'lat'                 => '40.8987905',
        'lon'                 => '-73.380290842494',
        'display_name'        => 'Huntington Beach, Mc Kinley Terrace, Centerport, Suffolk County, New York, 11721, USA'
      }
    },
    { data:
      {
        'lat'                 => '33.50666085',
        'lon'                 => '-79.0583509330297',
        'display_name'        => 'Huntington Beach, Jetty Drive, Huntington Marsh, North Litchfield Beach, Georgetown County, South Carolina, USA'
      }
    }
   ]
  )
  Geocoder::Lookup::Test.add_stub(
    "gggggggggggggggg", []
  )

  config.before(:each) do
    WebMock.reset!
    WebMock.disable_net_connect!
  end

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include FactoryBot::Syntax::Methods

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      provider: "google",
      uid: "12345678910",
      info: {
        email: "vinnie@spaghett.com",
        first_name: "Vinnie",
        last_name: "Tortellini"
      },
      credentials: {
        token: "12345",
        refresh_token: "123456",
        expires_at: DateTime.now,
      }
    })
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
