require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = build(:user, name: "" )
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: "" )
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a age" do
      user = build(:user, age: "" )
      user.valid?
      expect(user.errors[:age]).to include("を入力してください")
    end

    it "is invalid without a sex" do
      user = build(:user, sex: "" )
      user.valid?
      expect(user.errors[:sex]).to include("を入力してください")
    end

    it "is invalid without a disease" do
      user = build(:user, disease: "" )
      user.valid?
      expect(user.errors[:disease]).to include("を入力してください")
    end

    it "is invalid without a history" do
      user = build(:user, history: "" )
      user.valid?
      expect(user.errors[:history]).to include("を入力してください")
    end

    it "is invalid without a status" do
      user = build(:user, status: "" )
      user.valid?
      expect(user.errors[:status]).to include("を入力してください")
    end

    it "is valid without a image" do
      user = build(:user, image: "" )
      user.valid?
    end

    it "is valid without a word" do
      user = build(:user, word: "" )
      user.valid?
    end

    it "is valid without a sns" do
      user = build(:user, sns: "" )
      user.valid?
    end

    it "is invalid with a name more than 11 characters" do
      user = build(:user, name: "a" * 11 )
      user.valid?
      expect(user.errors[:name]).to include("は10文字以内で入力してください")
    end

    it "is invalid with a word more than 17 characters" do
      user = build(:user, word: "a" * 17 )
      user.valid?
      expect(user.errors[:word]).to include("は16文字以内で入力してください")
    end

    it "is invalid with a sns that has invalid value" do
      user = build(:user, sns: /http.+/ )
      user.valid?
      expect(user.errors[:sns]).to include("は不正な値です")
    end

  end
end