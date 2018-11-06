FactoryBot.define do
  factory :user do
    provider { "MyString" }
    uid { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    token { "MyString" }
    refresh_token { "MyString" }
    oauth_expires_at { "2018-11-05 18:27:25" }
  end
end
