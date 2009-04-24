Factory.define :user do |u|
  u.sequence(:login) { |n| "user_#{n}" }
  u.sequence(:email) { |n| "bangbang_#{n}@example.com" }
  u.password 'foobar0123'
  u.password_confirmation { |us| us.password }
end