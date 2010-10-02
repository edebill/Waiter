Factory.define(:user) do |f|
  f.sequence(:email) { |i|  "user#{i}@example.com" }
  f.password "password"
  f.password_confirmation "password"
end

Factory.define(:confirmed_user, :parent => :user) do |f|
  f.confirmed_at Time.zone.now
  f.confirmation_sent_at Time.zone.now - 1.minute
end
