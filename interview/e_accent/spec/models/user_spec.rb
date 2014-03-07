require 'spec_helper'

describe User do

  let(:'big_endian') {
    /\A([0-9]{4})[. \/-](0[1-9]|1[0-2])[. \/-](0[1-9]|[1-2][0-9]|3[0-1])\z/
  }
  let(:'middle_endian') {
    /\A(0[1-9]|1[0-2])[. \/-](0[1-9]|[1-2][0-9]|3[0-1])[. \/-]([0-9]{4})\z/ 
  }
  let(:'little_endian') {
    /\A(0[1-9]|[1-2][0-9]|3[0-1])[. \/-](0[1-9]|1[0-2])[. \/-]([0-9]{4})\z/ 
  }

  let(:new_user) {FactoryGirl.build :user}

  describe 'validation' do
    describe 'birthday' do
      it 'must not be blank' do
        new_user.birthday = nil
        expect(new_user.valid?).to eq false
        expect(new_user.errors[:birthday]).to include "is invalid"
        new_user.birthday = '  ' 
        expect(new_user.valid?).to eq false
        expect(new_user.errors[:birthday]).to include "is invalid"
      end
      describe 'big-endian validation' do
        before :each do
          EAccent::Application::AppConfig['date_format'] = 'big-endian'
        end
        it 'accecpts big-endian format' do
          valid_birthdays = ['1998.01.11', '1998 01 11', '1998/01/11', '1998-01-11']
          valid_birthdays.each do |birthday|
            new_user.birthday = birthday 
            expect(new_user.valid?).to be_true
          end
        end
        it 'is invalid if data is invalid' do
          invalid_birthdays = [
            '1998 01', '一九九八.01.11', '98.01.11', '1998,01,11',
            '1998-01-32', '1998/13/11', '01.11.1998', '11-01-1998'
          ]
          invalid_birthdays.each do |birthday|
            new_user.birthday = birthday
            expect(new_user.valid?).to be_false
            expect(new_user.errors[:birthday]).to include 'is invalid'
          end
        end
      end#big-endian validation
      describe 'middle-endian validation' do
        before :each do
          EAccent::Application::AppConfig['date_format'] = 'middle-endian'
        end
        it 'accecpts middle-endian format' do
          valid_birthdays = ['01.11.1998', '01 11 1998', '01/11/1998', '01-11-1998']
          valid_birthdays.each do |birthday|
            new_user.birthday = birthday 
            expect(new_user.valid?).to eq true
          end
        end
        it 'is invalid if data is invalid' do
          invalid_birthdays = [
            '01 1998', '01.11.一九九八', '01.11.98', '01,11,1998',
            '01-32-1998', '13/11/1998', '1998.01.11', '31-01-1998'
          ]
          invalid_birthdays.each do |birthday|
            new_user.birthday = birthday
            expect(new_user.valid?).to be_false
            expect(new_user.errors[:birthday]).to include 'is invalid'
          end
        end
      end#middle-endian validation
      describe 'little-endian validation' do
        before :each do
          EAccent::Application::AppConfig['date_format'] = 'little-endian'
        end
        it 'accecpts little-endian format' do
          valid_birthdays = ['11.01.1998', '11 01 1998', '11/01/1998', '11-01-1998']
          valid_birthdays.each do |birthday|
            new_user.birthday = birthday 
            expect(new_user.valid?).to eq true
          end
        end
        it 'is invalid if data is invalid' do
          invalid_birthdays = [
            '21 1998', '21.01.一九九八', '21.01.98', '21,01,1998',
            '32-01-1998', '11/13/1998', '1998.01.11', '01-21-1998'
          ]
          invalid_birthdays.each do |birthday|
            new_user.birthday = birthday
            expect(new_user.valid?).to be_false
            expect(new_user.errors[:birthday]).to include 'is invalid'
          end
        end
      end#little-endian validation
    end#birthday
  end#validation

  describe 'methods' do
    describe '.birthday_format' do 
      it 'returns rules which depends on AppConfig' do
        EAccent::Application::AppConfig['date_format'] = 'big-endian'
        expect(User.birthday_format).to eq big_endian
        EAccent::Application::AppConfig['date_format'] = 'middle-endian'
        expect(User.birthday_format).to eq middle_endian
        EAccent::Application::AppConfig['date_format'] = 'little-endian'
        expect(User.birthday_format).to eq little_endian
      end
    end#.birthday_format
    describe '.birthday_to_endian' do
      it "formats the user's birthday by endians" do
        EAccent::Application::AppConfig['date_format'] = 'big-endian'
        user = FactoryGirl.create :user, birthday: '1998/01/11'
        expect(user.birthday).to eq '1998-01-11'
        expect(user.birthday_to_endian).to eq '1998 01 11'
        expect(user.birthday).to eq '1998-01-11'
        EAccent::Application::AppConfig['date_format'] = 'middle-endian'
        user = FactoryGirl.create :user, birthday: '01/11/1998'
        expect(user.birthday).to eq '1998-01-11'
        expect(user.birthday_to_endian).to eq '01 11 1998'
        expect(user.birthday).to eq '1998-01-11'
        EAccent::Application::AppConfig['date_format'] = 'little-endian'
        user = FactoryGirl.create :user, birthday: '11/01/1998'
        expect(user.birthday).to eq '1998-01-11'
        expect(user.birthday_to_endian).to eq '11 01 1998'
        expect(user.birthday).to eq '1998-01-11'
      end
    end#.birthday_to_endian
  end#methods

  describe 'before save callback, #format_date' do
    describe 'new user' do
      it 'formats #birthday consistently by the current endian' do
        EAccent::Application::AppConfig['date_format'] = 'big-endian'
        new_user.birthday = '1998/11/01'
        new_user.save
        new_user.reload
        expect(new_user.birthday).to eq '1998-11-01'
        EAccent::Application::AppConfig['date_format'] = 'middle-endian'
        new_user.birthday = '11/01/1998'
        new_user.save
        new_user.reload
        expect(new_user.birthday).to eq '1998-11-01'
        EAccent::Application::AppConfig['date_format'] = 'little-endian'
        new_user.birthday = '01/11/1998'
        new_user.save
        new_user.reload
        expect(new_user.birthday).to eq '1998-11-01'
      end
    end
    describe 'existing user' do
      describe 'updates birthday' do
        it 'formats #birthday consistently by the current endian' do
          EAccent::Application::AppConfig['date_format'] = 'big-endian'
          user = FactoryGirl.create :user, birthday: '1998/01/11'
          user.birthday = '2000.01.11'
          user.save
          user.reload
          expect(user.birthday).to eq '2000-01-11'
          EAccent::Application::AppConfig['date_format'] = 'middle-endian'
          user = FactoryGirl.create :user, birthday: '01/11/1998'
          user.birthday = '01.11.2000'
          user.save
          user.reload
          expect(user.birthday).to eq '2000-01-11'
          EAccent::Application::AppConfig['date_format'] = 'little-endian'
          user = FactoryGirl.create :user, birthday: '11/01/1998'
          user.birthday = '11.01.2000'
          user.save
          user.reload
          expect(user.birthday).to eq '2000-01-11'
        end
      end#updates birthday
      describe 'without updating birthday' do
        it 'formats #birthday consistently by the current endian' do
          EAccent::Application::AppConfig['date_format'] = 'big-endian'
          user = FactoryGirl.create :user, birthday: '1998/01/11'
          user.save
          user.reload
          expect(user.birthday).to eq '1998-01-11'
          EAccent::Application::AppConfig['date_format'] = 'middle-endian'
          user = FactoryGirl.create :user, birthday: '01/11/1998'
          user.save
          user.reload
          expect(user.birthday).to eq '1998-01-11'
          EAccent::Application::AppConfig['date_format'] = 'little-endian'
          user = FactoryGirl.create :user, birthday: '11/01/1998'
          user.save
          user.reload
          expect(user.birthday).to eq '1998-01-11'
        end
      end#without updating birthday
    end
  end#before save callback

end
