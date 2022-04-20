FactoryBot.define do
  factory :user do
    nickname   {'test'}
    email      {'test@example'}
    password   {'abc000'}
    password_confirmation   {password}
    goal       {'10キロ痩せる'}
    second_goal   {'5キロ痩せる'}
    to_do      {'毎日野菜を食べる'}
  end
end