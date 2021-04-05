FactoryBot.define do
  factory :user do
    nickname              {"sampleuser"}
    email                 {"sample@sample.com"}
    password              {"123456"}
    password_confirmation {"123456"}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastname_kana         {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday             {"1995-05-04"}
  end
end