FactoryBot.define do
  factory :search do
    request { '/api/v1/users' }
    action { 'create' }
    params { "" }
    payload { {
      "email": "test@example.com",
      "password": "123",
      "password_confirmation": "123"
    } }
  end
end
