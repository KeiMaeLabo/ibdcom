FactoryBot.define do

  factory :user do
    name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    image {"default.jpg"}
    age {"30"}
    privacy {"1"}
    sex {"男性"}
    disease {"クローン病"}
    history {"1"}
    status {"発症"}
    word {"よろしくお願いします"}
    sns {"https//:twitter.com"}
  end

end