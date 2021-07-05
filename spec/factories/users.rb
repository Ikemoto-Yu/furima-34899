FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'ikemotoyu7'}
    password_confirmation {password}
    first_name            {遊}
    last_name             {池本}
    first_name_kana       {ユウ}
    last_name_kana        {イケモト}
    birthday              {1997-12-01}
  end
end