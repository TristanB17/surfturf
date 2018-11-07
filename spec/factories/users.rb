FactoryBot.define do
  factory :user do
    provider { "google" }
    uid { "12345" }
    first_name { "Ferdinand" }
    last_name { "Magellan" }
    email { "ionlyuseinternetexplorer@adventurer.com" }
    token { "12345" }
    refresh_token { "12345" }
    oauth_expires_at { "2018-11-05 18:27:25" }
  end
end
