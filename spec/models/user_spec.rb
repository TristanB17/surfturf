require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
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
  }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("google")
    expect(new_user.uid).to eq("12345678910")
    expect(new_user.email).to eq("vinnie@spaghett.com")
    expect(new_user.first_name).to eq("Vinnie")
    expect(new_user.last_name).to eq("Tortellini")
    expect(new_user.token).to eq("12345")
    expect(new_user.refresh_token).to eq("123456")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end
